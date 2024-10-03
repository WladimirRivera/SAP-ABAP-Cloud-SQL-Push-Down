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

    SELECT SINGLE
      FROM /dmo/carrier
      FIELDS carrier_id,
             name,
             concat( name, 'Airlines' ) AS full_name,
             concat_with_space( name, 'Airlines', 1 ) AS full_name_with_space,
             name && ' Airlines' AS full_name_ampersand
      WHERE carrier_id EQ 'AA'
      INTO @DATA(ls_result).

   " Display results
   IF ls_result IS NOT INITIAL.
     out->write( ls_result ).
   ENDIF.
  ENDMETHOD.
ENDCLASS.