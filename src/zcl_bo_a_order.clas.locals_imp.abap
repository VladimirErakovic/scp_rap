CLASS lhc_ZBO_A_ORDER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zbo_a_order.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zbo_a_order.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zbo_a_order.

    METHODS read FOR READ
      IMPORTING keys FOR READ zbo_a_order RESULT result.

    METHODS cba_ITEM FOR MODIFY
      IMPORTING entities_cba FOR CREATE zbo_a_order\_item.

    METHODS rba_ITEM FOR READ
      IMPORTING keys_rba FOR READ zbo_a_order\_item FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZBO_A_ORDER IMPLEMENTATION.

  METHOD create.
    DATA: lt_orders TYPE TABLE OF zordhdr.

    lt_orders = VALUE #(
        FOR ls_order IN entities
        (
            ordid = ls_order-ordid
            descr = ls_order-descr
            ord_date = ls_order-ord_date
            mbl_no = ls_order-mbl_no
        )
    ).
    INSERT zordhdr FROM TABLE @lt_orders.
  ENDMETHOD.

  METHOD delete.
    DATA: lt_orders TYPE RANGE OF char10.

    lt_orders = VALUE #(
        FOR ls_order IN keys
        (
            sign  = 'I'
            option = 'EQ'
            low = ls_order-ordid
        )
    ).
    DELETE FROM zordhdr WHERE ordid IN @lt_orders.
  ENDMETHOD.

  METHOD update.
    DATA: lt_orders TYPE TABLE OF zordhdr.

    lt_orders = VALUE #(
        FOR ls_order IN entities
        (
            ordid = ls_order-ordid
            descr = ls_order-descr
            ord_date = ls_order-ord_date
            mbl_no = ls_order-mbl_no
        )
    ).
    UPDATE zordhdr FROM TABLE @lt_orders.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD cba_ITEM.
    DATA: lt_items TYPE TABLE OF zorditm.

    lt_items = VALUE #(
       FOR ls_entity IN entities_cba
       FOR ls_item IN ls_entity-%target
       (
          ordid = ls_item-ordid
          orditm = ls_item-orditm
          item_descr = ls_item-item_descr
          item_cost = ls_item-item_cost
       )
    ).
    INSERT zorditm FROM TABLE @lt_items.
  ENDMETHOD.

  METHOD rba_ITEM.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZBO_ITEM DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zbo_item.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zbo_item.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zbo_item.

    METHODS read FOR READ
      IMPORTING keys FOR READ zbo_item RESULT result.

ENDCLASS.

CLASS lhc_ZBO_ITEM IMPLEMENTATION.

  METHOD create.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZBO_A_ORDER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS check_before_save REDEFINITION.

    METHODS finalize          REDEFINITION.

    METHODS save              REDEFINITION.

ENDCLASS.

CLASS lsc_ZBO_A_ORDER IMPLEMENTATION.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD finalize.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

ENDCLASS.
