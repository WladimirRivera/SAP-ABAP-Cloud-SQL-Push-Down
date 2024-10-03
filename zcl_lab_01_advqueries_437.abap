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
    " Get rows using EXCEPT
    SELECT FROM /dmo/flight
           FIELDS carrier_id, connection_id, price
           WHERE price GT 4000
    EXCEPT
    SELECT FROM /dmo/flight
           FIELDS carrier_id, connection_id, price
           WHERE price GT 6000
           INTO TABLE @DATA(lt_except_flights).

    " Display results
    IF lt_except_flights IS NOT INITIAL.
      out->write( lt_except_flights ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.