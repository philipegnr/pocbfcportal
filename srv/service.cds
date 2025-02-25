using {sap.lcap.pocbfcportalcap as my} from '../db/schema';
using {ZPSLE_BFC_VENDOR_PORTAL_SRV as externalMy} from './external/ZPSLE_BFC_VENDOR_PORTAL_SRV';

service ProcessorService {

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
    entity Status                     as projection on my.Status;
    entity CargoType                  as projection on externalMy.zpsle_fc_vh_ctyp_c;
    entity TransportRequisitionStatus as projection on my.TransportRequisitionStatus;
    entity zpsle_tr_h_t               as projection on my.zpsle_tr_h_t;
    entity zpsle_tr_i_t               as projection on my.zpsle_tr_i_t;
    entity zpsle_tr_s_t               as projection on my.zpsle_tr_s_t;
    entity zpsle_tr_ch_t              as projection on my.zpsle_tr_ch_t;

}

@path: '/service/ExternalProcessorService'
service ExternalProcessorService {
    @readonly
    entity ExtTransportRequisition as projection on externalMy.zpsle_vp_tr_header_c;

    @readonly
    entity ExtTrHeader             as projection on externalMy.zpsle_vp_tr_h_c;

    @readonly
    entity ExtTrItem               as projection on externalMy.zpsle_vp_tr_i_c;

    @readonly
    entity ExtTrStatus             as projection on externalMy.zpsle_vp_tr_s_c;
}

annotate ExternalProcessorService with @requires: ['authenticated-user'];

extend projection ProcessorService.TransportRequisition with {
    _CargoType : Association to one ProcessorService.CargoType on _CargoType.CargoType = CargoType
}
