@AbapCatalog.sqlViewName: 'ZA_ITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order Items'
define view ZBO_ITEM as select from zorditm 
    association to parent ZBO_A_ORDER as _Order on $projection.ordid = _Order.ordid
{

  key ordid,
  key orditm,
  item_descr,
  item_cost,
  _Order    
    
}
