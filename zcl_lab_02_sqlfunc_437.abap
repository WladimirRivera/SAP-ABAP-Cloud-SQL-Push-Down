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
    " Extractions - Properties Dates
    SELECT SINGLE
      FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             extract_year( flight_date ) AS year,
             extract_month( flight_date ) AS month,
             extract_day( flight_date ) AS day
      WHERE carrier_id EQ 'LH' AND connection_id EQ '400'
      INTO @DATA(ls_result).

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.