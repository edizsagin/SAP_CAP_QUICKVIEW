using {my.qucikview as db} from '../db/schema';

service CatalogService {
            @odata.draft.enabled

    // entity Products       as projection on db.Products;
    entity Products       as
        projection on db.Products {
            *,
        }
        actions {
            @Common.SideEffects: {TargetEntities: ['']}
            action Send();
        }

    entity ProductDetails as projection on db.ProductDetails;
    entity Currencies     as projection on db.Currencies;
    entity StatusTypes    as projection on db.StatusTypes;
    entity Suppliers      as projection on db.Suppliers;
}
