class ZCL_TRCKTRSR_MINION_TEDDY definition
  public
  final
  create public .

public section.

  interfaces ZIF_TRCKTRSR_MINION_TOOL .

  methods CONSTRUCTOR .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TRCKTRSR_MINION_TEDDY IMPLEMENTATION.


  METHOD CONSTRUCTOR.
    zif_trcktrsr_minion_tool~name = 'Teddy'.
  ENDMETHOD.
ENDCLASS.
