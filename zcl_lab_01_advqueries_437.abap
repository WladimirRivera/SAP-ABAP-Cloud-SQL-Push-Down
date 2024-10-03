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
  " Get common rows using INTERSECT
    SELECT FROM /dmo/flight
           FIELDS carrier_id, connection_id, price
           WHERE price gt 4000
    INTERSECT
    SELECT FROM /dmo/flight
           FIELDS carrier_id, connection_id, price
           WHERE price lt 6000
           INTO TABLE @DATA(lt_intersect_flights).

    " Display results
    IF lt_intersect_flights IS NOT INITIAL.
      out->write( lt_intersect_flights ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.