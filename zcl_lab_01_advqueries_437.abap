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

    " Select flights with price > 500
    SELECT  FROM /dmo/flight
    FIELDS carrier_id,
           connection_id
    WHERE price GT 500
           INTO TABLE @DATA(lt_flights).

    " Display results
    IF lt_flights IS NOT INITIAL.
      out->write( lt_flights ).
    ENDIF.
  ENDMETHOD.  
ENDCLASS.