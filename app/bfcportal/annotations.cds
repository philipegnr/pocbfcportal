using ProcessorService as service from '../../srv/service';
using from '../../db/schema';

annotate service.TransportRequisition with @(
    title               : '{i18n>entityTitleTransportRequisition}',
    UI.SelectionFields  : [Status, ],
    UI.FieldGroup #Teste: {
        $Type: 'UI.FieldGroupType',
        Data : [],
    },
);

annotate service.TransportRequisitionItem with @title: '{i18n>entityTitleTransportRequisitionItem}';
annotate service.TransportRequisition with @(UI.UpdateHidden: TrUpdateHidden);

annotate service.TransportRequisition with {
    DeparturePoint    @Common.Text: _DeparturePoint.PointDescription         @Common.TextArrangement: #TextOnly;
    DestinationPoint  @Common.Text: _DestinationPoint.PointDescription       @Common.TextArrangement: #TextOnly;
    CargoType         @Common.Text: _CargoType.CargoTypeDescription          @Common.TextArrangement: #TextOnly;
    Status            @Common.Text: _Status._StatusDetail.StatusDescription  @(
        Common.TextArrangement: #TextOnly,
        Common.Label          : 'Status',
    );
};

annotate service.CarrierHeader with {
    Observat @UI.MultiLineText;
};

annotate service.CarrierRoute with {
    DeparturePoint    @Common.Text: _DeparturePoint.PointDescription    @Common.TextArrangement: #TextOnly;
    DestinationPoint  @Common.Text: _DestinationPoint.PointDescription  @Common.TextArrangement: #TextOnly;
};

annotate service.CarrierFleet with {
    VehicleType  @Common.Text: _VehicleType.VehicleDesc  @Common.TextArrangement: #TextOnly;
};

annotate service.TransportRequisition with @(

    UI.HeaderInfo: {
        Title         : {
            $Type: 'UI.DataField',
            Value: Trnum
        },
        ImageUrl      : 'sap-icon://shipping-status',
        TypeName      : '{i18n>typeNameTransportRequisition}',
        TypeNamePlural: '{i18n>typeNamePluralTransportRequisitions}'
    },

    UI.LineItem  : [
        {
            $Type        : 'UI.DataFieldForAction',
            Action       : 'ProcessorService.acceptTr',
            Label        : 'Accept',
            Criticality  : #Positive,
            ![@UI.Hidden]: {$edmJson: {$If: [
                {$Or: [
                    {$Eq: [
                        {$Path: 'IsActiveEntity'},
                        false
                    ]},
                    {$Eq: [
                        {$Path: 'TrAcceptActionHidden'},
                        true
                    ]}
                ]},
                true,
                false
            ]}}
        },
        {
            $Type        : 'UI.DataFieldForAction',
            Action       : 'ProcessorService.rejectTr',
            Label        : 'Reject',
            Criticality  : #Negative,
            ![@UI.Hidden]: {$edmJson: {$If: [
                {$Or: [
                    {$Eq: [
                        {$Path: 'IsActiveEntity'},
                        false
                    ]},
                    {$Eq: [
                        {$Path: 'TrRejectActionHidden'},
                        true
                    ]}
                ]},
                true,
                false
            ]}}
        },
        {
            $Type        : 'UI.DataFieldForAction',
            Action       : 'ProcessorService.confirmTrDelivery',
            Label        : 'Confirm Delivery',
            Criticality  : #Positive,
            ![@UI.Hidden]: {$edmJson: {$If: [
                {$Or: [
                    {$Eq: [
                        {$Path: 'IsActiveEntity'},
                        false
                    ]},
                    {$Eq: [
                        {$Path: 'TrConfirmDeliveryActionHidden'},
                        true
                    ]}
                ]},
                true,
                false
            ]}}
        },
        {
            $Type: 'UI.DataField',
            Value: Trnum,
            Label: '{i18n>FieldLabelTrnum}',
        },
        {
            $Type      : 'UI.DataField',
            Value      : Status,
            Label      : '{i18n>FieldLabelStatus}',
            Criticality: _Status._StatusDetail.StatusCriticality
        },
        {
            $Type: 'UI.DataField',
            Value: DeparturePoint,
            Label: '{i18n>FieldLabelDeparturePoint}'
        },
        {
            $Type: 'UI.DataField',
            Value: DestinationPoint,
            Label: '{i18n>FieldLabelDestinationPoint}'
        },
        {
            $Type: 'UI.DataField',
            Value: CreatedAt,
            Label: '{i18n>FieldLabelCreatedAt}',
        },
        {
            $Type: 'UI.DataField',
            Value: CreatedBy,
            Label: '{i18n>FieldLabelCreatedBy}',
        },
        {
            $Type: 'UI.DataField',
            Value: SubmittedAt,
            Label: '{i18n>FieldLabelSubmittedAt}',
        },
        {
            $Type: 'UI.DataField',
            Value: SubmittedBy,
            Label: '{i18n>FieldLabelSubmittedBy}',
        },
        {
            $Type: 'UI.DataField',
            Value: CollectionTimestamp,
            Label: '{i18n>FieldLabelCollectionTimestamp}',
        },
        {
            $Type: 'UI.DataField',
            Value: DeliveryTimestamp,
            Label: '{i18n>FieldLabelDeliveryTimestamp}',
        },
    ]

);

annotate service.TransportRequisition with @(UI.Identification: [
    {
        $Type        : 'UI.DataFieldForAction',
        Action       : 'ProcessorService.acceptTr',
        Label        : 'Accept',
        Criticality  : #Positive,
        ![@UI.Hidden]: {$edmJson: {$If: [
            {$Or: [
                {$Eq: [
                    {$Path: 'IsActiveEntity'},
                    false
                ]},
                {$Eq: [
                    {$Path: 'TrAcceptActionHidden'},
                    true
                ]}
            ]},
            true,
            false
        ]}}
    },
    {
        $Type        : 'UI.DataFieldForAction',
        Action       : 'ProcessorService.rejectTr',
        Label        : 'Reject',
        Criticality  : #Negative,
        ![@UI.Hidden]: {$edmJson: {$If: [
            {$Or: [
                {$Eq: [
                    {$Path: 'IsActiveEntity'},
                    false
                ]},
                {$Eq: [
                    {$Path: 'TrRejectActionHidden'},
                    true
                ]}
            ]},
            true,
            false
        ]}}
    },
    {
        $Type        : 'UI.DataFieldForAction',
        Action       : 'ProcessorService.confirmTrDelivery',
        Label        : 'Confirm Delivery',
        Criticality  : #Positive,
        ![@UI.Hidden]: {$edmJson: {$If: [
            {$Or: [
                {$Eq: [
                    {$Path: 'IsActiveEntity'},
                    false
                ]},
                {$Eq: [
                    {$Path: 'TrConfirmDeliveryActionHidden'},
                    true
                ]}
            ]},
            true,
            false
        ]}}
    }
]);

annotate service.TransportRequisition with @(

    UI.DataPoint #StatusCriticality    : {
        Value      : Status,
        Title      : 'Status',
        Criticality: _Status._StatusDetail.StatusCriticality
    },

    UI.HeaderFacets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Route',
            ID    : 'ReferenceFaceteRoute',
            Target: '@UI.FieldGroup#DepartureDestination',
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Status',
            ID    : 'StatusId',
            Target: ![@UI.DataPoint#StatusCriticality]
        }
    ],

    UI.FieldGroup #DepartureDestination: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {

                $Type: 'UI.DataField',
                Value: DeparturePoint,
                Label: '{i18n>FieldLabelDeparturePoint}'
            },

            {
                $Type: 'UI.DataField',
                Value: DestinationPoint,
                Label: '{i18n>FieldLabelDestinationPoint}'
            }
        ],
    },

    UI.FieldGroup #GeneralInformation  : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: CargoType,
                Label: '{i18n>FieldLabelCargoType}',
            },
            {
                $Type: 'UI.DataField',
                Value: CreatedBy,
                Label: '{i18n>FieldLabelCreatedBy}',
            },
            {
                $Type: 'UI.DataField',
                Value: CreatedAt,
                Label: '{i18n>FieldLabelCreatedAt}',
            },
            {
                $Type: 'UI.DataField',
                Value: SubmittedBy,
                Label: '{i18n>FieldLabelSubmittedBy}',
            },
            {
                $Type: 'UI.DataField',
                Value: SubmittedAt,
                Label: '{i18n>FieldLabelSubmittedAt}',
            },
            {
                $Type: 'UI.DataField',
                Value: CollectionTimestamp,
                Label: '{i18n>FieldLabelCollectionTimestamp}',
            },
            {
                $Type: 'UI.DataField',
                Value: DeliveryTimestamp,
                Label: '{i18n>FieldLabelDeliveryTimestamp}',
            }

        ],
    },

    UI.FieldGroup #Addresses           : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {

                $Type: 'UI.DataField',
                Value: DepartureAddress,
                Label: '{i18n>FieldLabelDepartureAddress}'
            },

            {
                $Type: 'UI.DataField',
                Value: DestinationAddress,
                Label: '{i18n>FieldLabelDestinationAddress}'
            }
        ],
    },

    UI.Facets                          : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>FacetLabelBasicData}',
            ID    : 'i18nBasicData',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'FacetGeneralInformation',
                    Label : '{i18n>FacetGroupLabelGeneralInformation}',
                    Target: '@UI.FieldGroup#GeneralInformation',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'FacetDestination',
                    Label : '{i18n>FacetGroupLabelAddresses}',
                    Target: '@UI.FieldGroup#Addresses',
                },
            ],
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items',
            ID    : 'i18nItems',
            Target: '_TransportRequisitionItems/@UI.LineItem#i18nItems'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Response',
            ID    : 'i18nCarrierHeader',
            Target: '_CarrierHeader/@UI.FieldGroup#CarrierHeader'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Route',
            ID    : 'i18nCarrierRoute',
            Target: '_CarrierRoute/@UI.PresentationVariant'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Fleet',
            ID    : 'i18nCarrierFleet',
            Target: '_CarrierFleet/@UI.PresentationVariant'
        },
    ]
);

annotate service.TransportRequisitionItem with @(

UI.LineItem #i18nItems: [
    {
        $Type: 'UI.DataField',
        Value: Tritem,
        Label: '{i18n>FieldLabelTritem}',
    },
    {
        $Type: 'UI.DataField',
        Value: Material,
        Label: '{i18n>FieldLabelMaterial}',
    },
    {
        $Type: 'UI.DataField',
        Value: MaterialDesc,
        Label: '{i18n>FieldLabelMaterialDesc}',
    },

    {
        $Type: 'UI.DataField',
        Value: Quantity,
        Label: '{i18n>FieldLabelQuantity}',
    },

    {
        $Type: 'UI.DataField',
        Value: GrossWeight,
        Label: '{i18n>FieldLabelGrossWeight}',
    },
    {
        $Type: 'UI.DataField',
        Value: TotalGrossWeight,
        Label: '{i18n>FieldLabelTotalGrossWeight}',
    },
    {
        $Type: 'UI.DataField',
        Value: Lenght,
        Label: '{i18n>FieldLabelLenght}',
    },
    {
        $Type: 'UI.DataField',
        Value: Width,
        Label: '{i18n>FieldLabelWidth}',
    },
    {
        $Type: 'UI.DataField',
        Value: Height,
        Label: '{i18n>FieldLabelHeight}',
    },
    {
        $Type: 'UI.DataField',
        Value: Dangerous,
        Label: '{i18n>FieldLabelDangerous}',
    },
    {
        $Type: 'UI.DataField',
        Value: Price,
        Label: '{i18n>FieldLabelPrice}',
    },
    {
        $Type: 'UI.DataField',
        Value: TotalPrice,
        Label: '{i18n>FieldLabelTotalPrice}',
    }
]);

annotate service.CarrierHeader with @(

UI.FieldGroup #CarrierHeader: {
    $Type: 'UI.FieldGroupType',
    Data : [{
        $Type: 'UI.DataField',
        Value: Observat,
        Label: '{i18n>FieldLabelObservat}'
    }]
});

annotate service.CarrierRoute with @(

    UI.PresentationVariant: {
        SortOrder     : [{
            Property  : RouteSeq,
            Descending: true,
        }, ],
        Visualizations: ['@UI.LineItem']
    },

    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: RouteSeq,
            Label: '{i18n>FieldLabelRouteSeq}',
        },
        {
            $Type: 'UI.DataField',
            Value: DeparturePoint,
            Label: '{i18n>FieldLabelDeparturePoint}'
        },
        {
            $Type: 'UI.DataField',
            Value: DestinationPoint,
            Label: '{i18n>FieldLabelDestinationPoint}',
        },

        {
            $Type: 'UI.DataField',
            Value: Distance,
            Label: '{i18n>FieldLabelDistance}',
        }
    ]
);

annotate service.CarrierFleet with @(

    UI.PresentationVariant: {
        SortOrder     : [{
            Property  : FleetSeq,
            Descending: true,
        }, ],
        Visualizations: ['@UI.LineItem']
    },

    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: FleetSeq,
            Label: '{i18n>FieldLabelFleetSeq}'

        },
        {
            $Type: 'UI.DataField',
            Value: VehicleType,
            Label: '{i18n>FieldLabelVehicleType}',
        },
        {
            $Type: 'UI.DataField',
            Value: LicensePlate,
            Label: '{i18n>FieldLabelLicensePlate}',
        },
        {
            $Type: 'UI.DataField',
            Value: DriverName,
            Label: '{i18n>FieldLabelDriverName}',
        },
        {
            $Type: 'UI.DataField',
            Value: DriverLicense,
            Label: '{i18n>FieldLabelDriverLicense}',
        },
        {
            $Type: 'UI.DataField',
            Value: DriverCpf,
            Label: '{i18n>FieldLabelDriverCpf}',
        },
        {
            $Type: 'UI.DataField',
            Value: Quantity,
            Label: '{i18n>FieldLabelQuantity}',
        },
        {
            $Type: 'UI.DataField',
            Value: Cost,
            Label: '{i18n>FieldLabelCost}',
        }
    ]
);

annotate service.CarrierRoute with {
    DeparturePoint @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Point',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: DeparturePoint,
                    ValueListProperty: 'Point',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'PointDescription',
                },
            ],
        },
        Common.ValueListWithFixedValues: false
    )
};

annotate service.CarrierRoute with {
    DestinationPoint @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Point',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: DestinationPoint,
                    ValueListProperty: 'Point',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'PointDescription',
                },
            ],
        },
        Common.ValueListWithFixedValues: false
    )
};

annotate service.CarrierFleet with {
    VehicleType @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VehicleType',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: VehicleType,
                    ValueListProperty: 'VehicleType',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'VehicleDesc',
                },
            ],
        },
        Common.ValueListWithFixedValues: false
    )
};
