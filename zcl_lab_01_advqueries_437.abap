CLASS zcl_lab_01_advqueries_437 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_01_advqueries_437 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lv_price   TYPE /dmo/flight_price VALUE 500,
          lv_carrier TYPE /dmo/carrier_id VALUE 'AA'.

    " Select flights with price > 500 and carrier_id = AA
    SELECT  FROM /dmo/flight
    FIELDS carrier_id,
            connection_id,
            price
    WHERE carrier_id EQ @lv_carrier AND
          price GT @lv_price
    INTO TABLE @DATA(lt_flights).

    " Display results
    IF lt_flights IS NOT INITIAL.
      out->write( lt_flights ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.