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
    " Functions for Time Use
    SELECT SINGLE
          FROM /dmo/flight
          FIELDS carrier_id,
                 connection_id,
                 flight_date,
                 abap_user_timezone( on_error = @sql_abap_user_timezone=>set_to_null ) AS user_timezone,
                 abap_system_timezone( on_error = @sql_abap_system_timezone=>set_to_null ) AS system_timezone
          WHERE carrier_id EQ 'LH' AND connection_id EQ '400'
          INTO @DATA(ls_result).

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.