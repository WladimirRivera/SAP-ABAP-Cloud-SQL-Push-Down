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
    DATA: lt_temp_flights TYPE TABLE OF ztemp_flight_437.

    " Insert data into temporary table
    lt_temp_flights = VALUE #( ( carrier_id = 'SQ' connection_id = '0001' ) ).

    INSERT ztemp_flight_437 FROM TABLE @lt_temp_flights.

    " Select data from temporary table
    SELECT * FROM ztemp_flight_437 INTO TABLE @DATA(lt_temp_result).

    " Join temporary table with another table
    SELECT sp~carrier_id, sp~connection_id, sf~price
        FROM ztemp_flight_437 AS sp
        INNER JOIN /dmo/flight AS sf ON sp~carrier_id = sf~carrier_id AND
                                        sp~connection_id = sf~connection_id
           INTO TABLE @DATA(lt_joined_result).

    " Display results
    IF lt_joined_result IS NOT INITIAL.
      out->write( lt_joined_result ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.