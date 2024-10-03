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
    DATA lt_temp_flights TYPE ztemp_flight_437.

    " Functions for Timestamp
    GET TIME STAMP FIELD DATA(lv_timestamp).

    " Insert data into temporary table
    lt_temp_flights = VALUE #(  client = 100
                                carrier_id = 'SQ'
                                connection_id = '0001'
                                flight_date = cl_abap_context_info=>get_system_date( )
                                time = lv_timestamp ).


    INSERT ztemp_flight_437 FROM @lt_temp_flights.
    TRY.
        SELECT SINGLE
    FROM ztemp_flight_437
    FIELDS carrier_id,
             connection_id,
             flight_date,
           tstmp_is_valid( time ) AS valid_timestamp,
           tstmp_seconds_between( tstmp1 = tstmp_current_utctimestamp( ),
                                  tstmp2 = tstmp_add_seconds( tstmp = time,
                                                              seconds = CAST( 60 AS DEC( 15,0 ) ) ),
                                  on_error = @sql_tstmp_seconds_between=>set_to_null
            ) AS seconds_between
    INTO @DATA(ls_result).
      CATCH cx_sy_open_sql_db INTO DATA(lx_sqldb).
        out->write( lx_sqldb->get_text( ) ).
        RETURN.
    ENDTRY.

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.