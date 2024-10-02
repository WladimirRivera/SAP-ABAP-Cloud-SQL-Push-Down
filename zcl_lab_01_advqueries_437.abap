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
    " Insert data using subquery
    INSERT zspfli_437 FROM (
      SELECT FROM /dmo/carrier
             FIELDS carrier_id,
                    name,
                    currency_code
             WHERE currency_code GT 'EUR'
    ).

    " Select data to verify insertion
    SELECT * FROM zspfli_437 INTO TABLE @DATA(lt_inserted_data).

    " Display results
    IF lt_inserted_data IS NOT INITIAL.
      out->write( lt_inserted_data ).
    ENDIF.
  ENDMETHOD.