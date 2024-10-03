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
    DATA lt_results TYPE TABLE OF zavi_parent_437.
    " Hierarchies and Path Expressions

    delete FROM zavi_parent_437.

    INSERT zavi_parent_437 FROM TABLE @( value #(
    ( id = 1 parent_id = 0 aviation_name = 'Aviation 1' )
    ( id = 2 parent_id = 1 aviation_name = 'Aviation 2' )
    ( id = 3 parent_id = 2 aviation_name = 'Aviation 3' )
    ( id = 1 parent_id = 2 aviation_name = 'Aviation 1' ) ) ).

    SELECT FROM zavi_parent_437
      FIELDS *
      INTO TABLE @lt_results.

    " Display results
    IF lt_results IS NOT INITIAL.
      out->write( lt_results ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.