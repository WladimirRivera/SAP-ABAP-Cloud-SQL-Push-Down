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
    DATA lc_var TYPE i VALUE 1.
    " CDS with parameters

    SELECT FROM zcds_aviation_437( pId = @lc_var )
        FIELDS *
        INTO TABLE @DATA(lt_results).

    " Display results
    IF lt_results IS NOT INITIAL.
      out->write( lt_results ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
