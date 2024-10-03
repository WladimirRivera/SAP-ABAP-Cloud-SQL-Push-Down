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
    DATA: lv_tzone TYPE timezone,
          lv_time  TYPE t.
    " Conversions – Dates and Timestamps
    TRY.
        lv_tzone = cl_abap_context_info=>get_user_time_zone( ).
        lv_time = cl_abap_context_info=>get_system_time( ).
      CATCH cx_abap_context_info_error.
        RETURN.
    ENDTRY.

    SELECT SINGLE
      FROM /dmo/flight
      FIELDS carrier_id,
             connection_id,
             flight_date,
             tstmp_current_utctimestamp( ) AS current_utc,
             tstmp_to_tims( tstmp = tstmp_current_utctimestamp( ), tzone = @lv_tzone ) AS to_tims,
             tstmp_to_dst( tstmp = tstmp_current_utctimestamp( ), tzone = @lv_tzone ) AS to_dst,
             dats_tims_to_tstmp( date = flight_date, time = @lv_time, tzone = @lv_tzone ) AS to_tstmp
      WHERE carrier_id EQ 'LH' AND connection_id EQ '400'
      INTO @DATA(ls_result).

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.