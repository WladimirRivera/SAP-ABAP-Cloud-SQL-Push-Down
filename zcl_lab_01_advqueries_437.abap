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
    " Select flights and categorize prices
    SELECT FROM /dmo/flight
           FIELDS carrier_id, connection_id, price,
                  CASE
                    WHEN price lt 300 THEN 'Low'
                    WHEN price BETWEEN 300 AND 700 THEN 'Medium'
                    ELSE 'High'
                  END AS price_category
           INTO TABLE @DATA(lt_price_category).

    " Display results
    IF lt_price_category IS NOT INITIAL.
      out->write( lt_price_category ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.