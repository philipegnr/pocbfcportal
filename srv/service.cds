using {sap.lcap.pocbfcportalcap as my} from '../db/schema';
using {ZPSLE_BFC_VENDOR_PORTAL_SRV as externalMy} from './external/ZPSLE_BFC_VENDOR_PORTAL_SRV';

@path: '/service/ExternalProcessorService'
service ExternalProcessorService {
    @readonly
    entity ExternalTranspRequisition as projection on externalMy.zpsle_vp_tr_header_c;
}

annotate ExternalProcessorService with @requires: ['authenticated-user'];

service ProcessorService {

    //entity ExternalTrHeader as projection on external.zpsle_vp_tr_header_c;

    annotate ProcessorService.TransportRequisition with @odata.draft.enabled;

    annotate ProcessorService.TransportRequisition with @(
        Capabilities.InsertRestrictions: {Insertable: false},
        Capabilities.DeleteRestrictions: {Deletable: false}
    );


    entity TransportRequisition       as projection on my.TransportRequisition

        actions {
            @(
                Common.IsActionCritical        : true,
                cds.odata.bindingparameter.name: '_it',
                Common.SideEffects             : {TargetProperties: [
                    '_it/Status',
                    '_it/TrAcceptActionHidden',
                    '_it/TrRejectActionHidden',
                    '_it/TrConfirmDeliveryActionHidden',
                    '_it/TrUpdateHidden',
                ], }


            )
            action acceptTr();

            @(
                Common.IsActionCritical        : true,
                cds.odata.bindingparameter.name: '_it',
                Common.SideEffects             : {TargetProperties: [
                    '_it/Status',
                    '_it/TrAcceptActionHidden',
                    '_it/TrRejectActionHidden',
                    '_it/TrConfirmDeliveryActionHidden',
                    '_it/TrUpdateHidden',
                ], }
            )
            action rejectTr();

            @(
                Common.IsActionCritical        : true,
                cds.odata.bindingparameter.name: '_it',
                Common.SideEffects             : {TargetProperties: [
                    '_it/Status',
                    '_it/TrAcceptActionHidden',
                    '_it/TrRejectActionHidden',
                    '_it/TrConfirmDeliveryActionHidden',
                    '_it/TrUpdateHidden',
                ], }
            )
            action confirmTrDelivery();
        };


    entity TransportRequisitionHeader as projection on my.TransportRequisitionHeader;

    @readonly
    entity TransportRequisitionItem   as projection on my.TransportRequisitionItem;

    entity CarrierHeader              as projection on my.CarrierHeader;
    entity CarrierFleet               as projection on my.CarrierFleet;
    entity CarrierRoute               as projection on my.CarrierRoute;
    entity TrCurrentStatus            as projection on my.TrCurrentStatus;
    entity Point                      as projection on my.Point;
    entity VehicleType                as projection on my.VehicleType;
    entity CargoType                  as projection on my.CargoType;
    entity Status                     as projection on my.Status;
    entity zpsle_tr_s_t               as projection on my.zpsle_tr_s_t;
    entity zpsle_tr_ch_t              as projection on my.zpsle_tr_ch_t;

}
