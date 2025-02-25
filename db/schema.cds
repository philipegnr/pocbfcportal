namespace sap.lcap.pocbfcportalcap;

/********************************************************************************
 Entities
/********************************************************************************/
entity TransportRequisition       as
    select from TransportRequisitionHeader {
            @readonly
        key TransportRequisitionHeader.Trnum,
            @readonly
            Trtyp,
            @readonly
            Carrier,
            @readonly
            Segment,
            @readonly
            Project,
            @readonly
            Wbs,
            @readonly
            CargoType,
            @readonly
            Company,
            @readonly
            Plant,
            @readonly
            DeparturePoint,
            @readonly
            DestinationPoint,
            @readonly
            DepartureAddress,
            @readonly
            DestinationAddress,
            @readonly
            RequestedFor,
            @readonly
            CollectionTimestamp,
            @readonly
            DeliveryTimestamp,
            @readonly
            Observat,
            @readonly
            AutomaticallyCreated,
            @readonly
            Trcop,
            @readonly
            TrcopNewCarrier,
            @readonly
            CreationUser,
            @readonly
            CreationTimestamp,
            @readonly
            LastModifUser,
            @readonly
            LastModifTimestamp,
            @readonly
            Draft,
            @readonly
            WbsInternal,
            @readonly
            CanceledWithCosts,
            @readonly
            CarrierDefinedBy,
            @readonly
            Ebenumber,
            @readonly
            TravelNumber,
            _Status.Status as Status,
            _Status._StatusDetail.TrUpdateHidden,
            _Status._StatusDetail.TrAcceptActionHidden,
            _Status._StatusDetail.TrRejectActionHidden,
            _Status._StatusDetail.TrConfirmDeliveryActionHidden,
            @readonly
            _Status,
            @readonly
            _CreationStatus.Timestamp as CreatedAt,
            @readonly
            _CreationStatus.UserId    as CreatedBy,
            @readonly
            _SubmitStatus.Timestamp   as SubmittedAt,
            @readonly
            _SubmitStatus.UserId      as SubmittedBy,
            //_TransportRequisitionStatusHistory,
            _DeparturePoint,
            _DestinationPoint,
            //_CargoType,
            _TransportRequisitionItems,
            _CarrierHeader,
            _CarrierRoute,
            _CarrierFleet
    }

entity TransportRequisitionHeader as
    select from zpsle_tr_h_t as Header {
        key Header.trnum          as Trnum,
            trtyp                 as Trtyp,
            carrier               as Carrier,
            segment               as Segment,
            project               as Project,
            wbs                   as Wbs,
            cargo_type            as CargoType,
            company               as Company,
            plant                 as Plant,
            departure_point       as DeparturePoint,
            destination_point     as DestinationPoint,
            departure_address     as DepartureAddress,
            destination_address   as DestinationAddress,
            requested_for         as RequestedFor,
            collection_timestamp  as CollectionTimestamp,
            delivery_timestamp    as DeliveryTimestamp,
            observat              as Observat,
            automatically_created as AutomaticallyCreated,
            trcop                 as Trcop,
            trcop_new_carrier     as TrcopNewCarrier,
            creation_user         as CreationUser,
            creation_timestamp    as CreationTimestamp,
            last_modif_user       as LastModifUser,
            last_modif_timestamp  as LastModifTimestamp,
            draft                 as Draft,
            wbs_internal          as WbsInternal,
            canceled_with_costs   as CanceledWithCosts,
            carrier_defined_by    as CarrierDefinedBy,
            ebenumber             as Ebenumber,
            travel_number         as TravelNumber,
            _Status                    : Association to one TrCurrentStatus on _Status.Trnum = $self.Trnum,
            _CreationStatus            : Association to one TrCreationStatus on _CreationStatus.Trnum = $self.Trnum,
            _SubmitStatus              : Association to one TrSubmitStatus on _SubmitStatus.Trnum = $self.Trnum,
            //_TransportRequisitionStatusHistory : Composition of many TransportRequisitionStatus on _TransportRequisitionStatusHistory.Trnum = Trnum,
            _TransportRequisitionItems : Composition of many TransportRequisitionItem on _TransportRequisitionItems.Trnum = Trnum,
            _CarrierHeader             : Composition of one CarrierHeader on _CarrierHeader.Trnum = Trnum,
            _CarrierRoute              : Composition of many CarrierRoute on _CarrierRoute.Trnum = Trnum,
            _CarrierFleet              : Composition of many CarrierFleet on _CarrierFleet.Trnum = Trnum,
            _DeparturePoint            : Association to one Point on _DeparturePoint.Point = $self.DeparturePoint,
            _DestinationPoint          : Association to one Point on _DestinationPoint.Point = $self.DestinationPoint
    //_CargoType                 : Association to one CargoType on _CargoType.CargoType = $self.CargoType
    }

entity TransportRequisitionItem   as
    select from zpsle_tr_i_t {
        key trnum                as Trnum,
        key tritem               as Tritem,
            material             as Material,
            material_desc        as MaterialDesc,
            @Measures.ISOCurrency: QuantityUom
            quantity             as Quantity,
            quantity_uom         as QuantityUom,
            @Measures.ISOCurrency: GrossWeightUom
            gross_weight         as GrossWeight,
            gross_weight_uom     as GrossWeightUom,
            @Measures.ISOCurrency: GrossWeightUom
            total_gross_weight   as TotalGrossWeight,
            @Measures.ISOCurrency: DimensionsUom
            lenght               as Lenght,
            @Measures.ISOCurrency: DimensionsUom
            width                as Width,
            @Measures.ISOCurrency: DimensionsUom
            height               as Height,
            dimensions_uom       as DimensionsUom,
            @Measures.ISOCurrency: TotalDimensionsUom
            total_dimensions     as TotalDimensions,
            total_dimensions_uom as TotalDimensionsUom,
            dangerous            as Dangerous,
            @Measures.ISOCurrency: PriceCurrency
            price                as Price,
            price_currency       as PriceCurrency,
            @Measures.ISOCurrency: PriceCurrency
            total_price          as TotalPrice,
            cancel               as Cancel,
            creation_user        as CreationUser,
            creation_timestamp   as CreationTimestamp,
            last_modif_user      as LastModifUser,
            last_modif_timestamp as LastModifTimestamp,
            draft                as Draft
    }

entity TransportRequisitionStatus as
    select from zpsle_tr_s_t {
        key trnum       as Trnum,
        key seq         as Seq,
            status      as Status,
            reason_text as ReasonText,
            user_id     as UserId,
            timestamp   as Timestamp,
    }

entity Point                      as
    select from zpsle_fc_cp_t {
        key KNOTE as Point,
            BEZEI as PointDescription,
            CITY  as City,
            REGIO as State
    }

/* entity CargoType                  as
    select from zpsle_fc_ctyp_t {
        key CARGO_TYPE      as CargoType,
            CARGO_TYPE_DESC as CargoTypeDescription
    } */

entity Status                     as
    select from zpsle_fc_stat_t {
        key STATUS      as Status,
            STATUS_DESC as StatusDescription,
            case
                when
                    STATUS = 'CANC'
                then
                    1
                when
                    STATUS = 'CAR_APP'
                then
                    5
                when
                    STATUS = 'CAR_REJ'
                then
                    1
                when
                    STATUS = 'CAR_VAL'
                then
                    2
                when
                    STATUS = 'COMPL'
                then
                    3
                when
                    STATUS = 'LOG_VAL'
                then
                    2
                when
                    STATUS = 'ORDER'
                then
                    5
                else
                    0
            end         as StatusCriticality             : String(1),

            case
                when
                    STATUS = 'CAR_VAL'
                then
                    false
                else
                    true
            end         as TrAcceptActionHidden          : Boolean,
            case
                when
                    STATUS = 'CAR_VAL'
                then
                    false
                else
                    true
            end         as TrRejectActionHidden          : Boolean,

            case
                when
                    STATUS = 'ORDER'
                then
                    false
                else
                    true
            end         as TrConfirmDeliveryActionHidden : Boolean,

            case
                when
                    STATUS = 'CAR_VAL'
                then
                    false
                else
                    true
            end         as TrUpdateHidden                : Boolean

    }

entity CarrierHeader              as
    select from zpsle_tr_ch_t {
        key ID                         as Id,
            TRNUM                      as Trnum,
            COST                       as Cost,
            COST_CURRENCY              as CostCurrency,
            RESPONSE                   as Response,
            OBSERVAT                   as Observat,
            TIMESTAMP                  as ResponseTimestamp,
            COST_UNDER_CONTRACT        as CostUnderContract,
            CONFIRM_DELIVERY           as ConfirmDelivery,
            DISTANCE_COVERED           as DistanceCovered,
            DISTANCE_COVERED_UOM       as DistanceCoveredUom,
            SHIPPING_TIMESTAMP         as ShippingTimestamp,
            DELIVERY_TIMESTAMP         as DeliveryTimestamp,
            OBSERVAT_DELIVERY_CONFIRM  as ObservaDeliveryConfirm,
            TIMESTAMP_DELIVERY_CONFIRM as TimestampDeliveryConfirm,
    }

entity CarrierRoute               as
    select from zpsle_tr_cr_t {
        key ID                as Id,
            TRNUM             as Trnum,
            @readonly
            ROUTE_SEQ         as RouteSeq,
            @mandatory
            DEPARTURE_POINT   as DeparturePoint,
            @mandatory
            DESTINATION_POINT as DestinationPoint,
            DISTANCE          as Distance,
            DISTANCE_UOM      as DistanceUom,
            ROUTE_TYPE        as RouteType,
            _DeparturePoint   : Association to one Point on _DeparturePoint.Point = $self.DeparturePoint,
            _DestinationPoint : Association to one Point on _DestinationPoint.Point = $self.DestinationPoint,
    }

entity CarrierFleet               as
    select from zpsle_tr_cf_t {
        key ID             as Id,
            TRNUM          as Trnum,
            @mandatory
            VEHICLE_TYPE   as VehicleType,
            @mandatory
            LICENSE_PLATE  as LicensePlate,
            @readonly
            FLEET_SEQ      as FleetSeq,
            @mandatory
            DRIVER_NAME    as DriverName,
            DRIVER_LICENSE as DriverLicense,
            DRIVER_CPF     as DriverCpf,
            QUANTITY       as Quantity,
            @Measures.ISOCurrency: CostCurrency
            @mandatory
            COST           as Cost,
            @readonly
            COST_CURRENCY  as CostCurrency,
            VEHICLE_ID     as VehicleId,
            _VehicleType : Association to one VehicleType on _VehicleType.VehicleType = $self.VehicleType
    }

entity VehicleType                as
    select from zpsle_fc_vt_t {
        key VEHICLE_TYPE as VehicleType,
            VEHICLE_DESC as VehicleDesc
    }

/********************************************************************************
 Calculation views
/********************************************************************************/
entity TrCurrentStatus            as
    select from TransportRequisitionStatus as TrStatus {
        key TrStatus.Trnum  as Trnum,
        key TrStatus.Status as Status,
        key TrStatus.Seq    as Seq,
            _StatusDetail : Composition of one Status on _StatusDetail.Status = $self.Status,
    }
    where
        TrStatus.Seq = (
                select max(Seq) from TransportRequisitionStatus
                where
                    Trnum = TrStatus.Trnum
            )
        group by
            TrStatus.Trnum,
            TrStatus.Status,
            TrStatus.Seq;

entity TrCreationStatus           as
    select from TransportRequisitionStatus as TrStatus {
        key TrStatus.Trnum     as Trnum,
        key TrStatus.Status    as Status,
        key TrStatus.Seq       as Seq,
        key TrStatus.Timestamp as Timestamp,
        key TrStatus.UserId    as UserId,
            _StatusDetail : Composition of one Status on _StatusDetail.Status = $self.Status,
    }
    where
        TrStatus.Seq = (
                select max(Seq) from TransportRequisitionStatus
                where
                        Trnum  = TrStatus.Trnum
                    and Status = 'LOG_VAL'
            )
        group by
            TrStatus.Trnum,
            TrStatus.Status,
            TrStatus.Seq,
            TrStatus.Timestamp,
            TrStatus.UserId;

entity TrSubmitStatus             as
    select from TransportRequisitionStatus as TrStatus {
        key TrStatus.Trnum     as Trnum,
        key TrStatus.Status    as Status,
        key TrStatus.Seq       as Seq,
        key TrStatus.Timestamp as Timestamp,
        key TrStatus.UserId    as UserId,
            _StatusDetail : Composition of one Status on _StatusDetail.Status = $self.Status,
    }
    where
        TrStatus.Seq = (
                select max(Seq) from TransportRequisitionStatus
                where
                        Trnum  = TrStatus.Trnum
                    and Status = 'CAR_VAL'
            )
        group by
            TrStatus.Trnum,
            TrStatus.Status,
            TrStatus.Seq,
            TrStatus.Timestamp,
            TrStatus.UserId;

/********************************************************************************
 On-premise replicated tables
/********************************************************************************/
entity zpsle_tr_h_t {
    key trnum                 : String(10);
        trtyp                 : String(1);
        carrier               : String(10);
        segment               : String(4);
        project               : String(10);
        wbs                   : String(24);
        cargo_type            : String(2);
        company               : String(4);
        plant                 : String(4);
        departure_point       : String(10);
        destination_point     : String(10);
        departure_address     : String(200);
        destination_address   : String(200);
        requested_for         : String(30);
        collection_timestamp  : Timestamp;
        delivery_timestamp    : Timestamp;
        observat              : String(1000);
        automatically_created : Boolean;
        trcop                 : String(10);
        trcop_new_carrier     : Boolean;
        creation_user         : String(12);
        creation_timestamp    : Timestamp;
        last_modif_user       : String(12);
        last_modif_timestamp  : Timestamp;
        draft                 : Boolean;
        wbs_internal          : String(24);
        canceled_with_costs   : Boolean;
        carrier_defined_by    : String(4);
        ebenumber             : String(50);
        travel_number         : String(10);
}

entity zpsle_tr_i_t {
    key trnum                : String(10);
    key tritem               : String(5);
        material             : String(18);
        material_desc        : String(40);
        quantity             : Decimal(13, 3);
        quantity_uom         : String(3);
        gross_weight         : Decimal(15, 3);
        gross_weight_uom     : String(3);
        total_gross_weight   : Decimal(15, 3);
        lenght               : Decimal(13, 3);
        width                : Decimal(13, 3);
        height               : Decimal(13, 3);
        dimensions_uom       : String(3);
        total_dimensions     : Decimal(13, 3);
        total_dimensions_uom : String(3);
        dangerous            : Boolean;
        price                : Decimal(13, 2);
        price_currency       : String(5);
        total_price          : Decimal(13, 2);
        cancel               : Boolean;
        creation_user        : String(12);
        creation_timestamp   : Timestamp;
        last_modif_user      : String(12);
        last_modif_timestamp : Timestamp;
        draft                : Boolean
}

entity zpsle_tr_s_t {
    key trnum       : String(10);
    key seq         : Integer;
        status      : String(10);
        reason_text : String(120);
        user_id     : String(12);
        timestamp   : Timestamp;
}

entity zpsle_fc_cp_t {
    key KNOTE : String(10);
        BEZEI : String(50);
        CITY  : String(40);
        REGIO : String(3);
}

entity zpsle_fc_ctyp_t {
    key CARGO_TYPE      : String(2);
        CARGO_TYPE_DESC : String(50);
}

entity zpsle_fc_stat_t {
    key STATUS      : String(10);
        STATUS_DESC : String(30);
}

entity zpsle_fc_vt_t {
    key VEHICLE_TYPE : String(10);
        VEHICLE_DESC : String(50);
}

entity zpsle_tr_ch_t {
    key ID                         : UUID;
        TRNUM                      : String(10);
        COST                       : Decimal(13, 2);
        COST_CURRENCY              : String(5);
        RESPONSE                   : String(1);
        OBSERVAT                   : String(1000);
        TIMESTAMP                  : Timestamp;
        COST_UNDER_CONTRACT        : Boolean;
        CONFIRM_DELIVERY           : String(1);
        DISTANCE_COVERED           : Decimal(13, 3);
        DISTANCE_COVERED_UOM       : String(3);
        SHIPPING_TIMESTAMP         : Timestamp;
        DELIVERY_TIMESTAMP         : Timestamp;
        OBSERVAT_DELIVERY_CONFIRM  : String(1000);
        TIMESTAMP_DELIVERY_CONFIRM : Timestamp;
}

entity zpsle_tr_cf_t {
    key ID             : UUID;
        TRNUM          : String(10);
        VEHICLE_TYPE   : String(10);
        LICENSE_PLATE  : String(12);
        FLEET_SEQ      : Integer;
        DRIVER_NAME    : String(35);
        DRIVER_LICENSE : String(11);
        DRIVER_CPF     : String(11);
        QUANTITY       : Integer;
        COST           : Decimal(13, 2);
        COST_CURRENCY  : String(5) default 'BRL';
        VEHICLE_ID     : Integer;
}

entity zpsle_tr_cr_t {
    key ID                : UUID;
        TRNUM             : String(10);
        ROUTE_SEQ         : Integer;
        DEPARTURE_POINT   : String(10);
        DESTINATION_POINT : String(10);
        DISTANCE          : Decimal(13, 3);
        DISTANCE_UOM      : String(3);
        ROUTE_TYPE        : Integer;
}

entity zpsle_tr_ca_t {
    key ID                : UUID;
        TRNUM             : String(10);
        RESPONSE_SEQUENCE : Integer;
        ADD_COST_TYPE     : String(4);
        ADD_COST_SEQ      : Integer;
        RESPONSE_TYPE     : Integer;
        ADD_COST          : Decimal(13, 2);
        ADD_COST_CURRENCY : String(5);
        VEHICLE_ID        : Integer
}

entity zpsle_tr_cte_t {
    key ID                   : UUID;
        TRNUM                : String(10);
        CTE_ACCESS_KEY       : String(44);
        RESPONSE_SEQUENCE    : Integer;
        CTE_NUMBER           : String(9);
        CTE_TYPE             : Integer;
        RESPONSE_TYPE        : Integer;
        CREATION_USER        : String(12);
        CREATION_TIMESTAMP   : Timestamp;
        LAST_MODIF_USER      : String(12);
        LAST_MODIF_TIMESTAMP : Timestamp;
}
