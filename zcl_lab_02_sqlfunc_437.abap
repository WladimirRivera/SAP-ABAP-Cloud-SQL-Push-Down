CLASS zcl_lab_02_sqlfunc_437 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_02_sqlfunc_437 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lv_cucky TYPE /dmo/currency_code.
    lv_cucky = 'USD'.

    " Conversions – Amounts and Quantities
    SELECT SINGLE
        FROM /dmo/flight
        FIELDS carrier_id,
               connection_id,
               flight_date,
               price,
               currency_conversion( amount = price,
                                    source_currency = currency_code,
                                    target_currency = @lv_cucky,
                                    exchange_rate_date = @( cl_abap_context_info=>get_system_date( ) ),
                                    round = 'X' )
                                    AS converted_amount,
               'USD' AS converted_currency
        WHERE carrier_id EQ 'LH' AND connection_id EQ '400'
        INTO @DATA(ls_result).

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.