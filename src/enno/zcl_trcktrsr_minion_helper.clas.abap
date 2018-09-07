class ZCL_TRCKTRSR_MINION_HELPER definition
  public
  final
  create public .

public section.

  class-methods GET_LOCAL_CLASSES_OF_REPORT
    importing
      !REPORT type CLIKE
    returning
      value(CLASSES) type STRING_TABLE .
protected section.
private section.
ENDCLASS.



CLASS ZCL_TRCKTRSR_MINION_HELPER IMPLEMENTATION.


  METHOD get_local_classes_of_report.

    DATA vseo_tabs          TYPE saboo_vseot.
    DATA method_impls       TYPE saboo_method_impl_tab.
    DATA source_tab         TYPE saboo_sourt.

    READ REPORT report INTO source_tab.

    CALL FUNCTION 'SCAN_ABAP_OBJECTS_CLASSES'
      CHANGING
        vseo_tabs                   = vseo_tabs
        method_impls                = method_impls
        sourc_tab                   = source_tab
      EXCEPTIONS
        scan_abap_source_error      = 1
        scan_abap_src_line_too_long = 2
        OTHERS                      = 3.
    IF sy-subrc = 0.
      LOOP AT vseo_tabs-class_tab INTO DATA(vseo_class).
        APPEND vseo_class-clsname TO classes.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
