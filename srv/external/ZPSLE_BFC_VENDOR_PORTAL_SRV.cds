/* checksum : 097093f0ef0c6cc23b0984ec90ca9cfb */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZPSLE_BFC_VENDOR_PORTAL_SRV {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.SetStatusResponseSet {
  @sap.unicode : 'false'
  @sap.label : 'Message type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Type : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'Message Class'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Message number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Number : String(3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Message text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Message : String(220) not null;
  @sap.unicode : 'false'
  @sap.label : 'Log Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LogNo : String(20) not null;
  @sap.unicode : 'false'
  @sap.label : 'Message Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LogMsgNo : String(6) not null;
  @sap.unicode : 'false'
  @sap.label : 'Message Variable'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MessageV1 : String(50) not null;
  @sap.unicode : 'false'
  @sap.label : 'Message Variable'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MessageV2 : String(50) not null;
  @sap.unicode : 'false'
  @sap.label : 'Message Variable'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MessageV3 : String(50) not null;
  @sap.unicode : 'false'
  @sap.label : 'Message Variable'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MessageV4 : String(50) not null;
  @sap.unicode : 'false'
  @sap.label : 'Parameter Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Parameter : String(32) not null;
  @sap.unicode : 'false'
  @sap.label : 'Parameter line'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Row : Integer not null;
  @sap.unicode : 'false'
  @sap.label : 'Field name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Field : String(30) not null;
  @sap.unicode : 'false'
  @sap.label : 'Logical system'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  System : String(10) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.content.version : '1'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.CarrierResponseSet {
  @sap.unicode : 'false'
  @sap.label : 'Transport Requisiton'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Trnum : String(10) not null;
  @sap.unicode : 'false'
  @sap.unit : 'CostCurrency'
  @sap.label : 'Freight Cost'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Cost : Decimal(14, 3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  @sap.semantics : 'currency-code'
  CostCurrency : String(5) not null;
  @sap.unicode : 'false'
  @sap.label : 'Carrier Response'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Response : String(1) not null;
  @sap.unicode : 'false'
  @sap.label : 'Observation'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Observat : String(1000) not null;
  @odata.Type : 'Edm.DateTime'
  @sap.unicode : 'false'
  @sap.label : 'Accept/Reject on'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Timestamp : DateTime not null;
  @sap.unicode : 'false'
  @sap.label : 'Cost Under Contract'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CostUnderContract : Boolean not null;
  @sap.unicode : 'false'
  @sap.label : 'Confirm delivery'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ConfirmDelivery : String(1) not null;
  @sap.unicode : 'false'
  @sap.unit : 'DistanceCoveredUom'
  @sap.label : 'Distance Convered'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DistanceCovered : Decimal(13, 3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Base Unit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  @sap.semantics : 'unit-of-measure'
  DistanceCoveredUom : String(3) not null;
  @odata.Type : 'Edm.DateTime'
  @sap.unicode : 'false'
  @sap.label : 'Shipped on'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ShippingTimestamp : DateTime not null;
  @odata.Type : 'Edm.DateTime'
  @sap.unicode : 'false'
  @sap.label : 'Delivered on'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DeliveryTimestamp : DateTime not null;
  @sap.unicode : 'false'
  @sap.label : 'Observation'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ObservatDeliveryConfirm : String(1000) not null;
  @odata.Type : 'Edm.DateTime'
  @sap.unicode : 'false'
  @sap.label : 'Dlvr.Confirmed on'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  TimestampDeliveryConfirm : DateTime not null;
  HeaderToFleet : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.CarrierResponseFleetSet {  };
  HeaderToRoute : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.CarrierResponseRouteSet {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.content.version : '1'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.CarrierResponseRouteSet {
  @sap.unicode : 'false'
  @sap.label : 'Transport Requisiton'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Trnum : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Sequence'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key RouteSeq : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Departure point'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DeparturePoint : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Dest.point'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DestinationPoint : String(10) not null;
  @sap.unicode : 'false'
  @sap.unit : 'DistanceUom'
  @sap.label : 'Route Distance'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Distance : Decimal(13, 3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Base Unit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  @sap.semantics : 'unit-of-measure'
  DistanceUom : String(3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Route Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  RouteType : String(4) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.content.version : '1'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.CarrierResponseFleetSet {
  @sap.unicode : 'false'
  @sap.label : 'Transport Requisiton'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Trnum : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'Vehicle Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key VehicleType : String(10) not null;
  @sap.unicode : 'false'
  @sap.label : 'License Plate'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key LicensePlate : String(12) not null;
  @sap.unicode : 'false'
  @sap.label : 'Carrier Fleet Seq'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key FleetSeq : String(4) not null;
  @sap.unicode : 'false'
  @sap.label : 'Driver'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DriverName : String(35) not null;
  @sap.unicode : 'false'
  @sap.label : 'Driver License'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DriverLicense : String(11) not null;
  @sap.unicode : 'false'
  @sap.label : 'CPF'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DriverCpf : String(11) not null;
  @sap.unicode : 'false'
  @sap.label : 'Vehicle Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Quantity : String(4) not null;
  @sap.unicode : 'false'
  @sap.unit : 'CostCurrency'
  @sap.label : 'Freight Cost'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Cost : Decimal(14, 3) not null;
  @sap.unicode : 'false'
  @sap.label : 'Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  @sap.semantics : 'currency-code'
  CostCurrency : String(5) not null;
  @sap.unicode : 'false'
  @sap.label : 'Vehicle ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  VehicleId : String(3) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Carrier Value Help'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_carr_c {
  @sap.display.format : 'UpperCase'
  @sap.text : 'CarrierName'
  @sap.label : 'Carrier'
  key CarrierId : String(10) not null;
  @sap.display.format : 'UpperCase'
  CarrierName : String(35);
  @sap.label : 'Carrier Name'
  Name : String(35);
  @sap.label : 'Carrier Alias Name'
  CarrierAlias : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Status Value Help'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_stat_c {
  @sap.display.format : 'UpperCase'
  @sap.text : 'StatusDescription'
  @sap.label : 'Status'
  key Status : String(10) not null;
  @sap.label : 'Status Description'
  StatusDescription : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Gross Weight UoM Value Help'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_um_gw_c {
  @sap.text : 'UomDesc'
  @sap.label : 'Int. Meas. Unit'
  @sap.semantics : 'unit-of-measure'
  key Uom : String(3) not null;
  @sap.label : 'Unit text'
  UomDesc : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Gross Weight UoM Value Help'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_um_qt_c {
  @sap.text : 'UomDesc'
  @sap.label : 'Int. Meas. Unit'
  @sap.semantics : 'unit-of-measure'
  key Uom : String(3) not null;
  @sap.label : 'Unit text'
  UomDesc : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Transport Requisition'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_header_c {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transport Requisiton'
  key Trnum : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_CarrierVH/CarrierName'
  @sap.label : 'Carrier'
  @sap.value.list : 'standard'
  Carrier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_SegmentVH/SegmentDesc'
  @sap.label : 'Segment'
  @sap.value.list : 'standard'
  Segment : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'CargoTypeDesc'
  @sap.label : 'Cargo Type'
  @sap.value.list : 'standard'
  CargoType : String(2);
  @sap.label : 'Cargo Type Desc.'
  CargoTypeDesc : String(50);
  @sap.display.format : 'UpperCase'
  @sap.text : 'DeparturePointDesc'
  @sap.label : 'Departure Point'
  @sap.value.list : 'standard'
  DeparturePoint : String(10);
  @sap.label : 'Connection Point'
  DeparturePointDesc : String(50);
  @sap.display.format : 'UpperCase'
  @sap.text : 'DestinationPointDesc'
  @sap.label : 'Destination Point'
  @sap.value.list : 'standard'
  DestinationPoint : String(10);
  @sap.label : 'Connection Point'
  DestinationPointDesc : String(50);
  @sap.label : 'Departure Address'
  DepartureAddress : String(200);
  @sap.label : 'Destination Address'
  DestinationAddress : String(200);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Estimated Shipping'
  CollectionTimestamp : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Estimated Delivery'
  DeliveryTimestamp : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Created On'
  CreationTimestamp : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Time Stamp'
  SentToCarrierTimestamp : DateTime;
  @sap.display.format : 'UpperCase'
  @sap.text : 'StatusDesc'
  @sap.label : 'Status'
  @sap.value.list : 'standard'
  Status : String(10);
  @sap.label : 'Status Description'
  StatusDesc : String(30);
  @sap.display.format : 'UpperCase'
  StatusState : String(11);
  @odata.Type : 'Edm.Byte'
  NodeState : Integer;
  to_CargoTypeVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_ctyp_c {  };
  to_CarrierVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_carr_c {  };
  to_DepartureVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_point_c {  };
  to_DestinationVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_point_c {  };
  to_SegmentVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_segm_c {  };
  to_StatusVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_stat_c {  };
  to_TrHeader : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_h_c {  };
  to_TrItem : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_i_c {  };
  to_TrStatus : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_s_c {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Transport Requisition Header'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_h_c {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transport Requisiton'
  key trnum : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'WBS'
  wbs : String(24);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cargo Type'
  cargo_type : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Company'
  company : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Departure Point'
  departure_point : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Destination Point'
  destination_point : String(10);
  @sap.label : 'Departure Address'
  departure_address : String(200);
  @sap.label : 'Destination Address'
  destination_address : String(200);
  @sap.label : 'Requested For'
  requested_for : String(30);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Estimated Shipping'
  collection_timestamp : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Estimated Delivery'
  delivery_timestamp : DateTime;
  @sap.label : 'Observation'
  observat : String(1000);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Automatic.Created'
  automatically_created : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'TR Copy'
  trcop : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Define New Carrier'
  trcop_new_carrier : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  creation_user : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Created On'
  creation_timestamp : DateTime;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Last Modified By'
  last_modif_user : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Last Modified On'
  last_modif_timestamp : DateTime;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Draft'
  draft : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Element'
  wbs_internal : String(24);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Canceled with costs'
  canceled_with_costs : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Carrier Definition T'
  carrier_defined_by : String(4);
  @sap.label : 'EBE'
  ebenumber : String(50);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Travel Number'
  travel_number : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'TR Type'
  trtyp : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Carrier'
  carrier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Segment'
  segment : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Project'
  project : String(10);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Cargo Type Value Help'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_ctyp_c {
  @sap.display.format : 'UpperCase'
  @sap.text : 'CargoTypeDesc'
  @sap.label : 'Cargo Type'
  key CargoType : String(2) not null;
  @sap.label : 'Cargo Type Desc.'
  CargoTypeDesc : String(50);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Transport Requisition Item'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_item_c {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transport Requisiton'
  key Trnum : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'TR Item'
  key Tritem : String(5) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.value.list : 'standard'
  Material : String(18);
  @sap.label : 'Material Description'
  MaterialDesc : String(40);
  @sap.unit : 'QuantityUom'
  @sap.label : 'Quantity'
  Quantity : Decimal(13, 3) not null;
  @sap.text : 'to_QuantityUomVH/UomDesc'
  @sap.label : 'Base Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  QuantityUom : String(3) not null;
  @sap.unit : 'GrossWeightUom'
  @sap.label : 'Gross Weight'
  GrossWeight : Decimal(15, 3);
  @sap.text : 'to_GrossWeightUomVH/UomDesc'
  @sap.label : 'Unit of Weight'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  GrossWeightUom : String(3);
  @sap.unit : 'GrossWeightUom'
  @sap.label : 'Total Gross Weight'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TotalGrossWeight : Decimal(15, 3);
  @sap.unit : 'DimensionsUom'
  @sap.label : 'Length'
  Lenght : Decimal(13, 3);
  @sap.unit : 'DimensionsUom'
  @sap.label : 'Width'
  Width : Decimal(13, 3);
  @sap.unit : 'DimensionsUom'
  @sap.label : 'Height'
  Height : Decimal(13, 3);
  @sap.label : 'Unit of Dimension'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  DimensionsUom : String(3);
  @sap.unit : 'TotalDimensionsUom'
  @sap.label : 'Total Dimensions'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TotalDimensions : Decimal(13, 3);
  @sap.label : 'Unit of Dimension'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  TotalDimensionsUom : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dangerous'
  Dangerous : Boolean;
  @sap.unit : 'PriceCurrency'
  @sap.label : 'Value'
  Price : Decimal(14, 3) not null;
  @sap.label : 'Price Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  PriceCurrency : String(5);
  @sap.unit : 'TotalPriceCurrency'
  @sap.label : 'Total Value'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TotalPrice : Decimal(14, 3);
  @sap.label : 'Price Currency'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  TotalPriceCurrency : String(5);
  to_GrossWeightUomVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_um_gw_c {  };
  to_MaterialVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_mat_c {  };
  to_QuantityUomVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_um_qt_c {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Transport Requisition Item'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_i_c {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transport Requisiton'
  key trnum : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'TR Item'
  key tritem : String(5) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  material : String(18);
  @sap.label : 'Material Description'
  material_desc : String(40);
  @sap.unit : 'quantity_uom'
  @sap.label : 'Quantity'
  quantity : Decimal(13, 3);
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  quantity_uom : String(3);
  @sap.unit : 'gross_weight_uom'
  @sap.label : 'Gross Weight'
  gross_weight : Decimal(15, 3);
  @sap.label : 'Unit of Weight'
  @sap.semantics : 'unit-of-measure'
  gross_weight_uom : String(3);
  @sap.unit : 'gross_weight_uom'
  @sap.label : 'Total Gross Weight'
  total_gross_weight : Decimal(15, 3);
  @sap.unit : 'dimensions_uom'
  @sap.label : 'Length'
  lenght : Decimal(13, 3);
  @sap.unit : 'dimensions_uom'
  @sap.label : 'Width'
  width : Decimal(13, 3);
  @sap.unit : 'dimensions_uom'
  @sap.label : 'Height'
  height : Decimal(13, 3);
  @sap.label : 'Unit of Dimension'
  @sap.semantics : 'unit-of-measure'
  dimensions_uom : String(3);
  @sap.unit : 'total_dimensions_uom'
  @sap.label : 'Total Dimensions'
  total_dimensions : Decimal(13, 3);
  @sap.label : 'Unit of Dimension'
  @sap.semantics : 'unit-of-measure'
  total_dimensions_uom : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dangerous'
  dangerous : Boolean;
  @sap.unit : 'price_currency'
  @sap.label : 'Value'
  price : Decimal(14, 3);
  @sap.label : 'Price Currency'
  @sap.semantics : 'currency-code'
  price_currency : String(5);
  @sap.unit : 'price_currency'
  @sap.label : 'Total Value'
  total_price : Decimal(14, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cancelled'
  cancel : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  creation_user : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Created On'
  creation_timestamp : DateTime;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Last Modified By'
  last_modif_user : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Last Modified On'
  last_modif_timestamp : DateTime;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Draft'
  draft : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Transport Requisition Status'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_s_c {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transport Requisiton'
  key trnum : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Status Sequence'
  key seq : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status'
  status : String(10);
  @sap.label : 'Reason'
  reason_text : String(120);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Name'
  user_id : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Time Stamp'
  timestamp : DateTime;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Material Value Help'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_mat_c {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  key Material : String(18) not null;
  @sap.label : 'Material Description'
  MaterialDesc : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Type'
  MaterialType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group'
  MaterialGroup : String(9);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Point Value Help'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_point_c {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PointDesc'
  @sap.label : 'Points'
  key Point : String(10) not null;
  @sap.label : 'Connection Point'
  PointDesc : String(50);
  @sap.label : 'City'
  City : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region'
  State : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Segment Value Help'
entity ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_segm_c {
  @sap.display.format : 'UpperCase'
  @sap.text : 'SegmentDesc'
  @sap.label : 'Segment'
  key Segment : String(4) not null;
  @sap.label : 'Segment Description'
  SegmentDesc : String(30);
};

