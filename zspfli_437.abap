@EndUserText.label : 'Subquery Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zspfli_437 {

  key carrier_id : /dmo/carrier_id not null;
  name           : /dmo/carrier_name;
  currency_code  : /dmo/currency_code;

}