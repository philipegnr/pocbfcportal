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
            EbeNumber,
            @readonly
            TravelNumber,
            _Status.Status,
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
            _CargoType,
            _TransportRequisitionItems,
            _CarrierHeader,
            _CarrierRoute,
            _CarrierFleet
    }

entity TransportRequisitionHeader as
    select from zpsle_tr_h_t as Header {
        key Header.TRNUM          as Trnum,
            TRTYP                 as Trtyp,
            CARRIER               as Carrier,
            SEGMENT               as Segment,
            PROJECT               as Project,
            WBS                   as Wbs,
            CARGO_TYPE            as CargoType,
            COMPANY               as Company,
            PLANT                 as Plant,
            DEPARTURE_POINT       as DeparturePoint,
            DESTINATION_POINT     as DestinationPoint,
            DEPARTURE_ADDRESS     as DepartureAddress,
            DESTINATION_ADDRESS   as DestinationAddress,
            REQUESTED_FOR         as RequestedFor,
            COLLECTION_TIMESTAMP  as CollectionTimestamp,
            DELIVERY_TIMESTAMP    as DeliveryTimestamp,
            OBSERVAT              as Observat,
            AUTOMATICALLY_CREATED as AutomaticallyCreated,
            TRCOP                 as Trcop,
            TRCOP_NEW_CARRIER     as TrcopNewCarrier,
            CREATION_USER         as CreationUser,
            CREATION_TIMESTAMP    as CreationTimestamp,
            LAST_MODIF_USER       as LastModifUser,
            LAST_MODIF_TIMESTAMP  as LastModifTimestamp,
            DRAFT                 as Draft,
            WBS_INTERNAL          as WbsInternal,
            CANCELED_WITH_COSTS   as CanceledWithCosts,
            CARRIER_DEFINED_BY    as CarrierDefinedBy,
            EBENUMBER             as EbeNumber,
            TRAVEL_NUMBER         as TravelNumber,
            _Status                    : Association to one TrCurrentStatus on _Status.Trnum = $self.Trnum,
            _CreationStatus            : Association to one TrCreationStatus on _CreationStatus.Trnum = $self.Trnum,
            _SubmitStatus              : Association to one TrSubmitStatus on _SubmitStatus.Trnum = $self.Trnum,
            //_TransportRequisitionStatusHistory : Composition of many TransportRequisitionStatus on _TransportRequisitionStatusHistory.Trnum = Trnum,
            _TransportRequisitionItems : Composition of many TransportRequisitionItem on _TransportRequisitionItems.Trnum = Trnum,
            _CarrierHeader             : Composition of one CarrierHeader on _CarrierHeader.Trnum = Trnum,
            _CarrierRoute              : Composition of many CarrierRoute on _CarrierRoute.Trnum = Trnum,
            _CarrierFleet              : Composition of many CarrierFleet on _CarrierFleet.Trnum = Trnum,
            _DeparturePoint            : Association to one Point on _DeparturePoint.Point = $self.DeparturePoint,
            _DestinationPoint          : Association to one Point on _DestinationPoint.Point = $self.DestinationPoint,
            _CargoType                 : Association to one CargoType on _CargoType.CargoType = $self.CargoType
    }

entity TransportRequisitionItem   as
    select from zpsle_tr_i_t {
        key TRNUM                as Trnum,
        key TRITEM               as Tritem,
            MATERIAL             as Material,
            MATERIAL_DESC        as MaterialDesc,
            @Measures.ISOCurrency: QuantityUom
            QUANTITY             as Quantity,
            QUANTITY_UOM         as QuantityUom,
            @Measures.ISOCurrency: GrossWeightUom
            GROSS_WEIGHT         as GrossWeight,
            GROSS_WEIGHT_UOM     as GrossWeightUom,
            @Measures.ISOCurrency: GrossWeightUom
            TOTAL_GROSS_WEIGHT   as TotalGrossWeight,
            @Measures.ISOCurrency: DimensionsUom
            LENGHT               as Lenght,
            @Measures.ISOCurrency: DimensionsUom
            WIDTH                as Width,
            @Measures.ISOCurrency: DimensionsUom
            HEIGHT               as Height,
            DIMENSIONS_UOM       as DimensionsUom,
            @Measures.ISOCurrency: TotalDimensionsUom
            TOTAL_DIMENSIONS     as TotalDimensions,
            TOTAL_DIMENSIONS_UOM as TotalDimensionsUom,
            DANGEROUS            as Dangerous,
            @Measures.ISOCurrency: PriceCurrency
            PRICE                as Price,
            PRICE_CURRENCY       as PriceCurrency,
            @Measures.ISOCurrency: PriceCurrency
            TOTAL_PRICE          as TotalPrice,
            CANCEL               as Cancel,
            CREATION_USER        as CreationUser,
            CREATION_TIMESTAMP   as CreationTimestamp,
            LAST_MODIF_USER      as LastModifUser,
            LAST_MODIF_TIMESTAMP as LastModifTimestamp,
            DRAFT                as Draft
    }

entity TransportRequisitionStatus as
    select from zpsle_tr_s_t {
        key TRNUM       as Trnum,
        key SEQ         as Seq,
            STATUS      as Status,
            REASON_TEXT as ReasonText,
            USER_ID     as UserId,
            TIMESTAMP   as Timestamp,
    }

entity Point                      as
    select from zpsle_fc_cp_t {
        key KNOTE as Point,
            BEZEI as PointDescription,
            CITY  as City,
            REGIO as State
    }

entity CargoType                  as
    select from zpsle_fc_ctyp_t {
        key CARGO_TYPE      as CargoType,
            CARGO_TYPE_DESC as CargoTypeDescription
    }

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
    key TRNUM                 : String(10);
        TRTYP                 : String(1);
        CARRIER               : String(10);
        SEGMENT               : String(4);
        PROJECT               : String(10);
        WBS                   : String(24);
        CARGO_TYPE            : String(2);
        COMPANY               : String(4);
        PLANT                 : String(4);
        DEPARTURE_POINT       : String(10);
        DESTINATION_POINT     : String(10);
        DEPARTURE_ADDRESS     : String(200);
        DESTINATION_ADDRESS   : String(200);
        REQUESTED_FOR         : String(30);
        COLLECTION_TIMESTAMP  : Timestamp;
        DELIVERY_TIMESTAMP    : Timestamp;
        OBSERVAT              : String(1000);
        AUTOMATICALLY_CREATED : Boolean;
        TRCOP                 : String(10);
        TRCOP_NEW_CARRIER     : Boolean;
        CREATION_USER         : String(12);
        CREATION_TIMESTAMP    : Timestamp;
        LAST_MODIF_USER       : String(12);
        LAST_MODIF_TIMESTAMP  : Timestamp;
        DRAFT                 : Boolean;
        WBS_INTERNAL          : String(8);
        CANCELED_WITH_COSTS   : Boolean;
        CARRIER_DEFINED_BY    : String(4);
        EBENUMBER             : String(50);
        TRAVEL_NUMBER         : String(10);
}

entity zpsle_tr_i_t {
    key TRNUM                : String(10);
    key TRITEM               : String(5);
        MATERIAL             : String(18);
        MATERIAL_DESC        : String(40);
        QUANTITY             : Decimal(13, 3);
        QUANTITY_UOM         : String(3);
        GROSS_WEIGHT         : Decimal(15, 3);
        GROSS_WEIGHT_UOM     : String(3);
        TOTAL_GROSS_WEIGHT   : Decimal(15, 3);
        LENGHT               : Decimal(13, 3);
        WIDTH                : Decimal(13, 3);
        HEIGHT               : Decimal(13, 3);
        DIMENSIONS_UOM       : String(3);
        TOTAL_DIMENSIONS     : Decimal(13, 3);
        TOTAL_DIMENSIONS_UOM : String(3);
        DANGEROUS            : Boolean;
        PRICE                : Decimal(13, 2);
        PRICE_CURRENCY       : String(5);
        TOTAL_PRICE          : Decimal(13, 2);
        CANCEL               : Boolean;
        CREATION_USER        : String(12);
        CREATION_TIMESTAMP   : Timestamp;
        LAST_MODIF_USER      : String(12);
        LAST_MODIF_TIMESTAMP : Timestamp;
        DRAFT                : Boolean
}

entity zpsle_tr_s_t {
    key TRNUM       : String(10);
    key SEQ         : Integer;
        STATUS      : String(10);
        REASON_TEXT : String(120);
        USER_ID     : String(12);
        //CF_USER_ID  : String(220);
        TIMESTAMP   : Timestamp;
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
