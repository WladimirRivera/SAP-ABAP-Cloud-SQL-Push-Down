CLASS zcl_lab_03_cdshierarchy_437 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_03_cdshierarchy_437 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
     " Path Expression - Associations
    SELECT FROM /dmo/i_flight
         FIELDS AirlineID,
                ConnectionID,
                FlightDate,
                \_Airline[ (1) ]-Name AS Name,
                \_Airline[ CurrencyCode = 'EUR' ]-Name AS AirlineNameEUR,
                \_Airline\_Currency-CurrencyISOCode,
                \_Airline\_Currency\_Text[ Language = 'E' AND Currency = 'EUR' ]-CurrencyShortName
         INTO TABLE @DATA(lt_results).

    " Display results
    IF lt_results IS NOT INITIAL.
      out->write( lt_results ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
