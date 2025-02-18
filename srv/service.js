const cds = require('@sap/cds');
const { json } = require('@sap/cds/lib/compile/parse');
const { UUID } = require('@sap/cds/lib/core/classes');

class ProcessorService extends cds.ApplicationService {
  init() {
    const appHandler = new AppHandler(this);
    this.before('CREATE', 'CarrierRoute.drafts', req => appHandler.beforeCreateCarrierRoute(req));
    this.before('CREATE', 'CarrierFleet.drafts', req => appHandler.beforeCreateCarrierFleet(req));
    this.before('UPDATE', 'CarrierFleet.drafts', req => appHandler.beforeUpdateCarrierFleet(req));
    this.before('READ', 'TransportRequisition', req => appHandler.beforeReadTransportRequisition(req));
    //this.on('startReply', 'TransportRequisition', req => appHandler.startReply(req));
    this.on('acceptTr', 'TransportRequisition', req => appHandler.setTrAccepted(req));
    this.on('rejectTr', 'TransportRequisition', req => appHandler.setTrRejected(req));
    this.on('confirmTrDelivery', 'TransportRequisition', req => appHandler.setTrDeliveryConfirmed(req));
    return super.init();
  }
}

class AppHandler {

  constructor(service) {
    this.service = service;
    this.appData = new AppData(service);
    this.appValidation = new AppValidation(service);
  }

  async beforeReadTransportRequisition(req) {
    await this.appData.initializeCarrierResponse(req, this);
  }

  async beforeCreateCarrierRoute(req) {
    await this.appData.setValuesForCarrierRoute(req, this);
  }

  async beforeCreateCarrierFleet(req) {
    await this.appData.setValuesForCarrierFleet(req, this);
  }

  async beforeUpdateCarrierFleet(req) {
    this.appValidation.validateDriverCpf(req);
    this.appValidation.validateLicensePlate(req);
  }

  async setTrAccepted(req) {
    console.log("Passando pelo setTrAccepted");
    if (await this.appValidation.validateTrStatusCreation(AppConstants.STATUS_ACCEPTED, req, this)) {
      await this.appValidation.validateTrAcceptance(req, this);
      await this.appData.createTrStatus(AppConstants.STATUS_ACCEPTED, req, this);
    }
  }

  async setTrRejected(req) {
    if (await this.appValidation.validateTrStatusCreation(AppConstants.STATUS_REJECTED, req, this)) {
      await this.appValidation.validateTrRejection(req, this);
      await this.appData.createTrStatus(AppConstants.STATUS_REJECTED, req, this);
    }
  }

  async setTrDeliveryConfirmed(req) {
    if (await validateTrStatusCreation(AppConstants.STATUS_DELIVERY_CONFIRMED, req, this)) {
      await validateTrDeliveryConfirmation(req, this);
      await this.appDataHandler.createTrStatus(AppConstants.STATUS_DELIVERY_CONFIRMED, req, this);
    }
  }
}

class AppData {

  constructor(service) {
    this.service = service;
  }

  async initializeCarrierResponse(req, that) {
    this.initializeCarrierHeader(req, that);
    //this.initializeCarrierRoute(req, that);
  }

  async createTrStatus(newStatus, req, that) {
    console.log("Passando pelo createTrStatus");
    const { TrCurrentStatus, zpsle_tr_s_t } = that.service.entities;
    const tx = cds.transaction(req);
    const currentStatus = await tx.run(
      SELECT.one().from(TrCurrentStatus)
        .where({ Trnum: req.params[0].Trnum })
    ) || { CurrentSequential: 0 };
    const newSequential = currentStatus.Seq + 1;
    const newStatusRecord = {
      TRNUM: req.params[0].Trnum,
      SEQ: newSequential,
      STATUS: newStatus,
      USER_ID: 'VENDOR',
      TIMESTAMP: cds.context.timestamp
    };
    console.log("New Status Record to be inserted: " + JSON.stringify(newStatusRecord));
    await tx.run(INSERT.into(zpsle_tr_s_t).entries(newStatusRecord));
    switch (newStatus) {
      case AppConstants.STATUS_ACCEPTED:
        console.log('TR Accepted successfully');
        req.notify('STATUS_ACCEPTED_SUCCESS', [req.params[0].Trnum]);
        break;
      case AppConstants.STATUS_REJECTED:
        console.log('TR Rejected successfully');
        req.notify('STATUS_REJECTED_SUCCESS', [req.params[0].Trnum]);
        break;
      case AppConstants.STATUS_DELIVERY_CONFIRMED:
        console.log('Delivery confirmed successfully');
        req.notify('STATUS_DELIVERY_CONFIRMED_SUCCESS', [req.params[0].Trnum]);
        break;
      default:
        console.log('None new valid status has been found');
        req.error({
          message: 'None new valid status has been found',
          status: 418
        })
        break;
    }
  }

  async initializeCarrierHeader(req, that) {
    if (typeof req.data.Trnum !== "undefined") {
      const tx = cds.transaction(req);
      const { CarrierHeader, TrCurrentStatus, zpsle_tr_ch_t } = that.service.entities;
      const carrierHeader = await tx.run(
        SELECT()
          .from(CarrierHeader)
          .where({ Trnum: req.data.Trnum })
      )
      if (carrierHeader.length === 0) {
        const currentStatus = await tx.run(
          SELECT.one().from(TrCurrentStatus)
            .where({ Trnum: req.data.Trnum })
        )
        if (currentStatus.Status === AppConstants.STATUS_PENDING_OF_APPROVAL) {
          const initialCarrierHeader = {
            ID: cds.utils.uuid(),
            TRNUM: req.data.Trnum
          };
          await tx.run(INSERT.into(zpsle_tr_ch_t).entries(initialCarrierHeader));
        }
      }
    }
  }

  async initializeCarrierRoute(req, that) {
    if (typeof req.data.Trnum !== "undefined") {
      const tx = cds.transaction(req);
      const { CarrierRoute, TransportRequisition, zpsle_tr_cr_t } = that.service.entities;
      const routes = await tx.run(
        SELECT()
          .from(CarrierRoute)
          .where({ Trnum: req.data.Trnum })
          .orderBy('RouteSeq')
      )
      if (routes.length === 0) {
        req.data.RouteSeq = 1;
        const transportRequisition = await tx.run(
          SELECT.one().from(TransportRequisition)
            .where({ Trnum: req.data.Trnum })
        )
        const defaultCarrierRoute = {
          ID: cds.utils.uuid(),
          TRNUM: req.data.Trnum,
          ROUTE_SEQ: 1,
          DEPARTURE_POINT: transportRequisition.DeparturePoint,
          DESTINATION_POINT: transportRequisition.DestinationPoint
        };
        await tx.run(INSERT.into(zpsle_tr_cr_t).entries(defaultCarrierRoute));
      }
    }
  }

  async setValuesForCarrierRoute(req, that) {
    const tx = cds.transaction(req);
    const { CarrierRoute, TransportRequisition } = that.service.entities;
    const routes = await tx.run(
      SELECT()
        .from(CarrierRoute.drafts)
        .where({ Trnum: req.data.Trnum })
        .orderBy('RouteSeq')
    )
    if (routes.length === 0) {
      req.data.RouteSeq = 1;
      const transportRequisition = await tx.run(
        SELECT.one().from(TransportRequisition)
          .where({ Trnum: req.data.Trnum })
      )
      req.data.DeparturePoint = transportRequisition.DeparturePoint;
      req.data.DestinationPoint = transportRequisition.DestinationPoint;
    } else {
      req.data.RouteSeq = routes.length + 1;
      let lastRoute = routes[routes.length - 1];
      req.data.DeparturePoint = lastRoute.DestinationPoint;
    }
  }

  async setValuesForCarrierFleet(req, that) {
    const tx = cds.transaction(req);
    const { CarrierFleet } = that.service.entities;
    const { FleetSeq: maxSequential } = await tx.run(
      SELECT.one('max(FleetSeq) as FleetSeq')
        .from(CarrierFleet.drafts)
        .where({ Trnum: req.data.Trnum })
    ) || { FleetSeq: 0 };
    req.data.FleetSeq = (maxSequential || 0) + 1;
  }
}

class AppValidation {

  constructor(service) {
    this.service = service;
  }

  async validateTrAcceptance(req, that) {
    console.log("Passando pelo validateTrAcceptance");
    await this.validateCarrierRoute(req, that);
    await this.validateCarrierFleet(req, that);
  }

  async validateTrRejection(req, that) {
    await this.validateCarrierHeader(req, that);
  }

  async validateTrDeliveryConfirmation(req, that) {

  }

  async validateCarrierHeader(req, that) {
    const tx = cds.transaction(req);
    const { CarrierHeader } = that.service.entities;
    const carrierHeader = await tx.run(
      SELECT.one().from(CarrierHeader)
        .where({ Trnum: req.params[0].Trnum })
    )
    if (typeof carrierHeader.Observat !== "undefined") {
      if (carrierHeader.Observat === null) {
        req.error({
          code: 'HEADER_OBSERVAT_NOT_INFORMED',
          status: 418
        })
      }
    }
  }

  async validateCarrierRoute(req, that) {
    console.log("Passando pelo validateCarrierRoute");
    const tx = cds.transaction(req);
    const { TransportRequisition, CarrierRoute } = that.service.entities;
    const routes = await tx.run(
      SELECT()
        .from(CarrierRoute)
        .where({ Trnum: req.params[0].Trnum })
        .orderBy('RouteSeq')
    )
    if (routes.length === 0) {
      req.error({
        code: 'ROUTE_NOT_INFORMED',
        status: 418
      })
    } else {
      const transportRequisition = await tx.run(
        SELECT.one().from(TransportRequisition)
          .where({ Trnum: req.params[0].Trnum })
      )

      if (routes.length === 1) {
        if (routes[0].DeparturePoint !== transportRequisition.DeparturePoint) {
          req.error({
            code: 'ROUTE_DEPARTURE_INVALID',
            status: 418
          })
        }
        if (routes[0].DestinationPoint !== transportRequisition.DestinationPoint) {
          req.error({
            code: 'ROUTE_DESTINATION_INVALID',
            status: 418
          })
        }
      } else {
        for (let i = 0; i < routes.length; i++) {
          if (i = 0) {
            if (routes[i].DeparturePoint !== transportRequisition.DeparturePoint) {
              req.error({
                code: 'ROUTE_DEPARTURE_INVALID',
                status: 418
              })
            }
          } else if (i = routes.length - 1) {
            if (routes[i].DestinationPoint !== transportRequisition.DestinationPoint) {
              req.error({
                code: 'ROUTE_DESTINATION_INVALID',
                status: 418
              })
            }
          }
          if (routes[i].DeparturePoint === routes[i].DestinationPoint) {
            req.error({
              code: 'ROUTE_SAME_DEPART_DEST',
              status: 418
            })
          }
          for (let j = 0; j < routes.length; j++) {
            if (routes[i].Id !== routes[j].Id) {
              if (routes[i].DeparturePoint === routes[j].DeparturePoint) {
                req.error({
                  code: 'ROUTE_MULTIPLE_DEPART',
                  status: 418
                })
              }
              if (routes[i].DestinationPoint === routes[j].DestinationPoint) {
                req.error({
                  code: 'ROUTE_MULTIPLE_DEST',
                  status: 418
                })
              }
              if (i > 0) {
                if (routes[j].DestinationPoint !== routes[i - 1].DeparturePoint) {
                  req.error({
                    code: 'ROUTE_DEST_UNMATCH_PREVIOUS_DEPART',
                    status: 418
                  })
                }
              }
            }
          }
        }
      }
    }
  }

  async validateCarrierFleet(req, that) {
    console.log("Passando pelo validateCarrierFleet");
    const tx = cds.transaction(req);
    const { CarrierFleet } = that.service.entities;
    const fleet = await tx.run(
      SELECT()
        .from(CarrierFleet)
        .where({ Trnum: req.params[0].Trnum })
        .orderBy('FleetSeq')
    )
    if (fleet.length === 0) {
      req.error({
        code: 'FLEET_VEHICLE_NOT_INFORMED',
        status: 418
      })
    }
  }

  async validateTrStatusCreation(newStatus, req, that) {
    console.log("Passando pelo validateTrStatusCreation");
    let valid = false;
    const { TrCurrentStatus } = that.service.entities;
    const tx = cds.transaction(req);
    const currentStatus = await tx.run(
      SELECT.one().from(TrCurrentStatus)
        .where({ Trnum: req.params[0].Trnum })
    )
    if (!this.checkNewTrStatusIsValid(currentStatus.Status, newStatus)) {
      req.error({
        code: 'STATUS_ACTION_NOT_ALLOWED',
        status: 418
      })
    } else {
      valid = true;
    }
    return valid;
  }

  validateLicensePlate(req) {
    if (typeof req.data.LicensePlate !== "undefined") {
      if (req.data.LicensePlate !== null && !this.checkLicensePlate(req.data.LicensePlate)) {
        req.error({
          code: 'FLEET_LICENSE_PLATE_INVALID',
          target: 'LicensePlate',
          status: 400,
        });
      }
    }
  }

  checkNewTrStatusIsValid(currentStatus, newStatus) {
    let newStatusIsValid = false;
    switch (newStatus) {
      case AppConstants.STATUS_ACCEPTED:
        if (currentStatus === AppConstants.STATUS_PENDING_OF_APPROVAL) {
          newStatusIsValid = true;
        }
        break;
      case AppConstants.STATUS_REJECTED:
        if (currentStatus === AppConstants.STATUS_PENDING_OF_APPROVAL) {
          newStatusIsValid = true;
        }
        break;
      case AppConstants.STATUS_DELIVERY_CONFIRMED:
        if (currentStatus === AppConstants.STATUS_TRANSPORT_ORDERED) {
          newStatusIsValid = true;
        }
        break;
      default:
        break;
    }
    return newStatusIsValid;
  }

  validateDriverCpf(req) {
    if (typeof req.data.DriverCpf !== "undefined") {
      if (req.data.DriverCpf !== null && !this.checkCpf(req.data.DriverCpf)) {
        req.error({
          code: 'FLEET_CPF_INVALID',
          target: 'DriverCpf',
          status: 400,
        });
      }
    }
  }

  checkLicensePlate(LicensePlate) {
    const regex = /^[A-Z]{3}-\d{4}$|^[A-Z]{3}\d{1}[A-Z]{1}\d{2}$/;
    return regex.test(LicensePlate);
  }

  checkCpf(cpf) {
    return true;
  }
}

class AppConstants {
  static STATUS_CANCELED = 'CANC';
  static STATUS_LOGISTICS_VALIDATION = 'LOG_VAL';
  static STATUS_PENDING_OF_APPROVAL = 'CAR_VAL';
  static STATUS_ACCEPTED = 'CAR_APP';
  static STATUS_REJECTED = 'CAR_REJ';
  static STATUS_TRANSPORT_ORDERED = 'ORDER';
  static STATUS_DELIVERY_CONFIRMED = 'COMPL';
}

module.exports = { ProcessorService }














