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
    " Functions for Character Strings
    SELECT SINGLE
         FROM /dmo/flight
         FIELDS carrier_id,
                connection_id,
                flight_date,
                left( carrier_id, 2 ) AS left_id,
                right( carrier_id, 2 ) AS right_id,
                lpad( carrier_id, 5, '0' ) AS lpad_id,
                rpad( carrier_id, 5, '0' ) AS rpad_id,
                ltrim( carrier_id, 'L' ) AS ltrim_id,
                rtrim( carrier_id, 'H' ) AS rtrim_id,
                instr( carrier_id, 'LH' ) AS instr_id,
                substring( carrier_id, 1, 2 ) AS substring_id,
                length( carrier_id ) AS length_id,
                replace( carrier_id, 'LH', 'XX' ) AS replace_id,
                lower( carrier_id ) AS lower_id,
                upper( carrier_id ) AS upper_id
         WHERE carrier_id EQ 'LH'
         INTO @DATA(ls_result).

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.