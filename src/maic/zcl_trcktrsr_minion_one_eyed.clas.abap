class ZCL_TRCKTRSR_MINION_ONE_EYED definition
  public
  inheriting from ZCL_TRCKTRSR_MINION_BASE
  final
  create public .

public section.

  methods CONSTRUCTOR .

  methods GET_N_O_EYES_AS_TEXT
    redefinition .
protected section.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TRCKTRSR_MINION_ONE_EYED IMPLEMENTATION.


  METHOD CONSTRUCTOR.
    super->constructor( ).
    me->set_n_o_eyes( i_eyes = 1 ).
  ENDMETHOD.


  METHOD GET_N_O_EYES_AS_TEXT.
    r_result = 'one eye'.
  ENDMETHOD.
ENDCLASS.
