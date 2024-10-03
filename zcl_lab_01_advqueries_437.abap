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
    " Combine results using UNION
    SELECT FROM /dmo/flight
           FIELDS carrier_id, connection_id, price
           WHERE price lt 4000
    UNION
    SELECT FROM /dmo/flight
           FIELDS carrier_id, connection_id, price
           WHERE price gt 6000
           INTO TABLE @DATA(lt_union_flights).

    " Display results
    IF lt_union_flights IS NOT INITIAL.
      out->write( lt_union_flights ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.