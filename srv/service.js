const cds = require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');

module.exports = class CatalogService extends cds.ApplicationService {
  init() {

    const { Products } = cds.entities('CatalogService')

    this.before(['CREATE', 'UPDATE'], Products.drafts, async (req) => {
      req.data.status_code = 1;
    });

    this.before('SAVE', Products, (req) => {
      req.data.status_code = 2
    });

    this.on('Send', Products, async req => {
      const keys = req.params[0];
      await UPDATE(Products)
        .set({ status_code: '3' })
        .where(keys);

      req.info(200, `Product ${keys.ProdID} sent successfully`);

      return {};
    });
    return super.init()
  }
}
