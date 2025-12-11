using {managed} from '@sap/cds/common';

namespace my.qucikview;

entity Products : managed {
    key ProdID   : String                     @readonly;
        name     : String;
        price    : Decimal(10, 2);
        currency : Association to Currencies;
        supplier : Association to Suppliers;
        status   : Association to StatusTypes @readonly;
        rating   : Integer;
        details  : Association to ProductDetails
                       on details.ProdID = ProdID;
}

entity Suppliers : managed {
    key SupID : String;
        name  : String;
        city  : String;
        phone : String;
}

entity Currencies {
    key code : String;
        name : String;
}

entity StatusTypes {
    key code : Integer;
        text : String;
}


entity ProductDetails : managed {
    key ProdID          : String;
        longDescription : String(255);
        category        : String(40);
        brand           : String(40);
        stockQuantity   : Integer;
        unitOfMeasure   : String(10);
        countryOfOrigin : String(60);
}


annotate Products with {
    ProdID @plugin.numberrange.rangeid: 'PROD_RANGE';
};
