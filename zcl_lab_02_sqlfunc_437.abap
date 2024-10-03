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
    " UUID – Universal Unique Identifier

    DELETE FROM zspfli_437.

    INSERT zspfli_437 FROM ( SELECT FROM /dmo/flight
                               FIELDS uuid( ) AS id,
                                      carrier_id,
                                      currency_code ).
    SELECT FROM zspfli_437
        FIELDS *
        INTO TABLE @DATA(ls_result).

    " Display results
    IF ls_result IS NOT INITIAL.
      out->write( ls_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.