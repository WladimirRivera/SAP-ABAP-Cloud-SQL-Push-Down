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
*    Numerical functions
    SELECT SINGLE
      FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             price,
             seats_max,
             seats_occupied,
             CAST( price AS FLTP ) / CAST( seats_max AS FLTP ) AS ratio,
             division( price, seats_max, 2 ) AS division,
             div( seats_max, seats_occupied ) AS div,
             mod( seats_max, seats_occupied ) AS mod,
             abs( seats_max - seats_occupied ) AS abs,
             ceil( price ) AS ceil,
             floor( price ) AS floor,
             round( price, 2 ) AS round
      WHERE carrier_id EQ 'LH' AND connection_id EQ '400'
      INTO @DATA(ls_result).

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.