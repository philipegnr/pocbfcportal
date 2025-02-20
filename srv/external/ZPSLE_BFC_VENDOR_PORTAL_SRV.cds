/* checksum : c853505fac666d263c6041743b4c071a */
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
  to_Item : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_vp_tr_item_c {  };
  to_SegmentVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_segm_c {  };
  to_StatusVH : Association to many ZPSLE_BFC_VENDOR_PORTAL_SRV.zpsle_fc_vh_stat_c {  };
};

