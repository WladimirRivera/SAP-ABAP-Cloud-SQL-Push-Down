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
    " Hierarchical Selection
    TRY.
        SELECT FROM HIERARCHY(  SOURCE zcds_aviation_437
                                CHILD TO PARENT ASSOCIATION _Aviation
                                START WHERE id = 1
                                SIBLINGS ORDER BY id ASCENDING
                                MULTIPLE PARENTS ALLOWED
                                ORPHANS ROOT
                                CYCLES BREAKUP )
                    FIELDS Id,
                           ParentId,
                           AviationName,
                           hierarchy_is_cycle,
                           hierarchy_is_orphan,
                           hierarchy_level,
                           hierarchy_parent_rank,
                           hierarchy_rank,
                           hierarchy_tree_size
                    INTO TABLE @DATA(lt_results).

        " Display results
        IF lt_results IS NOT INITIAL.
          out->write( lt_results ).
        ENDIF.
      CATCH cx_SY_OPEN_SQL_DB INTO DATA(lx_sql_db).
        out->write( lx_sql_db->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
