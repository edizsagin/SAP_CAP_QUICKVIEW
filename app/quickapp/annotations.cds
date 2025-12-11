using CatalogService as service from '../../srv/service';

annotate service.Products with @(
    UI.HeaderInfo                : {
        TypeName      : 'Product',
        TypeNamePlural: 'Products',

        Title         : {Value: name},

        Description   : {Value: ProdID},

        TypeImageUrl  : 'sap-icon://product' // header icon
    },
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type                    : 'UI.DataFieldForAction',
                Label                    : 'Send',
                Action                   : 'CatalogService.Send',
                Inline                   : true,
                CriticalityRepresentation: #WithIcon,
                Criticality              : #Positive,
            },
            {
                $Type: 'UI.DataField',
                Value: ProdID,
                Label: 'Product',
            },
            {
                $Type: 'UI.DataField',
                Value: supplier_SupID,
            },
            {
                $Type: 'UI.DataField',
                Value: name,
                Label: 'Name',
            },
            {
                $Type: 'UI.DataField',
                Value: price,
                Label: 'Price',
            },
            {
                $Type: 'UI.DataField',
                Value: currency_code,
                Label: 'Currency',
                @UI.Hidden,
            },
            {
                $Type: 'UI.DataField',
                Value: rating,
                Label: 'Rating',
            },
            {
                $Type      : 'UI.DataField',
                Value      : status_code,
                Label      : 'Status',
                Criticality: status.code,
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt,
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'Details',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type                    : 'UI.DataFieldForAction',
            Label                    : 'Send',
            Action                   : 'CatalogService.Send',
            Criticality              : #Neutral,
            CriticalityRepresentation: #WithIcon,
        },
        {
            $Type: 'UI.DataField',
            Value: ProdID,
            Label: 'Product',
        },
        {
            $Type: 'UI.DataField',
            Value: supplier_SupID,
            Label: 'Supplier',
        },
        {
            @UI.Hidden: true,
            $Type     : 'UI.DataFieldForAnnotation',
            Label     : 'Details',
            Target    : 'details/@UI.QuickViewFacets'
        },
        // 🔽 QuickView trigger
        {
            @UI.Hidden: true,
            $Type     : 'UI.DataFieldForAnnotation',
            Label     : 'Supplier',
            Target    : 'supplier/@UI.QuickViewFacets'
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'Name',
        },
        {
            $Type: 'UI.DataField',
            Value: price,
            Label: 'Price',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.DataPoint#rating',
            Label : 'Rating',
        },
        {
            $Type      : 'UI.DataField',
            Value      : status.text,
            Label      : 'Status',
            Criticality: status.code,
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy,
        },
    ],
    UI.LineItem.@UI.Criticality  : status_code,
    UI.SelectionFields           : [
        ProdID,
        supplier.SupID,
        currency.name,
        status.code,
    ],
    UI.DataPoint #rating         : {
        Value        : rating,
        Visualization: #Rating,
        TargetValue  : 5,
    },
    UI.DataPoint #rating1        : {
        $Type        : 'UI.DataPointType',
        Value        : rating,
        Title        : 'Rating',
        TargetValue  : 5,
        Visualization: #Rating,
    },
    UI.HeaderFacets              : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'rating',
        Target: '@UI.DataPoint#rating1',
    }, ],
);

annotate service.Products with {
    price @(
        Semantics.amount.currencyCode: 'currency',
        Measures.ISOCurrency         : currency_code,
    );
};

annotate service.Products with {
    supplier @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Suppliers',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: supplier_SupID,
                    ValueListProperty: 'SupID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
            ],
        },
        Common.Label                   : 'Supplier ID',
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.Suppliers with @(
    UI.HeaderInfo                   : {
        TypeName      : 'Supplier',
        TypeNamePlural: 'Suppliers',

        Title         : {Value: name},

        Description   : {Value: city},

        TypeImageUrl  : 'sap-icon://supplier' // header icon
    },
    UI.QuickViewFacets              : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Supplier Info',
        Target: '@UI.FieldGroup#SupplierQuickView'
    }],
    UI.FieldGroup #SupplierQuickView: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Supplier ID',
                Value: SupID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Name',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Label: 'City',
                Value: city
            },
            {
                $Type: 'UI.DataField',
                Label: 'Phone',
                Value: phone
            }
        ]
    }
);

annotate service.ProductDetails with @(

    UI.HeaderInfo                        : {
        TypeName      : 'Product Detail',
        TypeNamePlural: 'Product Details',
        Title         : {Value: category},
        Description   : {Value: brand},
        TypeImageUrl  : 'sap-icon://product'
    },

    UI.QuickViewFacets                   : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Product Detail Info',
        Target: '@UI.FieldGroup#ProductDetailQuickView'
    }],

    UI.FieldGroup #ProductDetailQuickView: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Product ID',
                Value: ProdID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Long Description',
                Value: longDescription,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Category',
                Value: category
            },
            {
                $Type: 'UI.DataField',
                Label: 'Brand',
                Value: brand
            },
            {
                $Type: 'UI.DataField',
                Label: 'Stock Quantity',
                Value: stockQuantity
            },
            {
                $Type: 'UI.DataField',
                Label: 'Unit',
                Value: unitOfMeasure
            },
            {
                $Type: 'UI.DataField',
                Label: 'Country of Origin',
                Value: countryOfOrigin
            }
        ]
    }
);


annotate service.Products with {
    ProdID @(
        Common.Label                   : 'Product ID',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Products',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: ProdID,
                ValueListProperty: 'ProdID',
            }, ],
            Label         : 'Product ID',
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.Suppliers with {
    SupID @(
        Common.Label                   : 'Supplier ID',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Suppliers',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: SupID,
                ValueListProperty: 'SupID',
            }, ],
            Label         : 'Supplier ID',
        },
        Common.ValueListWithFixedValues: true,
        Common.Text                    : name,
        Common.Text.@UI.TextArrangement: #TextFirst,
    )
};

annotate service.Currencies with {
    name @(
        Common.Label                   : 'Currency',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Currencies',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: name,
                ValueListProperty: 'code',
            }, ],
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.Currencies with {
    code @(
        Common.Text                    : name,
        Common.Text.@UI.TextArrangement: #TextFirst,
    )
};

annotate service.StatusTypes with {
    text @(Common.Label: 'Status',
    )
};

annotate service.StatusTypes with {
    code @(
        Common.Text                    : text,
        Common.Text.@UI.TextArrangement: #TextFirst,
        Common.Label                   : 'Status',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'StatusTypes',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: code,
                ValueListProperty: 'code',
            }, ],
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.Products with {
    status @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'StatusTypes',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: status_code,
                ValueListProperty: 'code',
            }, ],
            Label         : 'Status',
        },
        Common.ValueListWithFixedValues: true,
        Common.Text                    : status.text,
        Common.Text.@UI.TextArrangement: #TextFirst,
    )
};

annotate service.Products with {
    currency @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Currencies',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: currency_code,
                ValueListProperty: 'code',
            }, ],
        },
        Common.ValueListWithFixedValues: true,
    )
};
