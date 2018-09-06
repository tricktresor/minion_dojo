class ZCL_TRCKTRSR_MINION_EVIL definition
  public
  inheriting from ZCL_TRCKTRSR_MINION_BASE
  final
  create public .

public section.

  interfaces ZIF_MHZ_MINION_EVIL .

  methods CONSTRUCTOR .

  methods GET_N_O_EYES_AS_TEXT
    redefinition .
protected section.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TRCKTRSR_MINION_EVIL IMPLEMENTATION.


  METHOD CONSTRUCTOR.
    super->constructor( ).
    me->set_n_o_eyes( i_eyes = 2 ).
  ENDMETHOD.


  METHOD GET_N_O_EYES_AS_TEXT.
    r_result = 'two eyes'.
  ENDMETHOD.
ENDCLASS.
