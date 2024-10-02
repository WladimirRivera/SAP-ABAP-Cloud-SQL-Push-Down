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
    " Define subquery using WITH clause
    WITH +cte_flights AS (
      SELECT FROM /dmo/flight
             FIELDS carrier_id, connection_id, price
             WHERE price gt 500
    )
    SELECT sf~carrier_id, sf~connection_id, sf~price
           FROM +cte_flights as sp
           INNER JOIN /dmo/flight AS sf ON sp~carrier_id = sf~carrier_id AND
                                        sp~connection_id = sf~connection_id
           INTO TABLE @DATA(lt_cte_result).

    " Display results
    IF lt_cte_result IS NOT INITIAL.
      out->write( lt_cte_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.