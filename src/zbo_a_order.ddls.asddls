@AbapCatalog.sqlViewName: 'ZA_ORDER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order details'
define root view ZBO_A_ORDER as select from zordhdr
    composition [0..*] of ZBO_ITEM as _Item
 {
    
  key ordid,
  descr,
  ord_date,
  mbl_no,
  _Item  
    
}
