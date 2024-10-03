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
    " Functions for Dates
    SELECT SINGLE
        FROM /dmo/flight
        FIELDS carrier_id,
               connection_id,
               flight_date,
               dats_is_valid( flight_date ) AS valid_date,
               dats_add_days( flight_date, 30 ) AS date_plus_30,
               dats_days_between( flight_date, flight_date ) AS days_between,
               dats_add_months( flight_date, -2 ) AS date_minus_2_months
        WHERE carrier_id EQ 'LH' AND connection_id EQ '400'
        INTO @DATA(ls_result).

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.