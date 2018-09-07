CLASS zcl_trcktrsr_minion_base DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS c_banana TYPE string VALUE 'BANANAAA!!!' ##NO_TEXT.

    METHODS set_name
      IMPORTING
        !i_name TYPE string .
    METHODS banana
      RETURNING
        VALUE(r_banana) TYPE string .
    METHODS get_n_o_eyes
      RETURNING
        VALUE(r_result) TYPE i .
    METHODS get_n_o_eyes_as_text
          ABSTRACT
      RETURNING
        VALUE(r_result) TYPE string .
    METHODS get_name
      RETURNING
        VALUE(r_result) TYPE string .
    METHODS get_tool
      RETURNING
        VALUE(r_result) TYPE REF TO zif_trcktrsr_minion_tool .
    METHODS set_tool
      IMPORTING
        !i_tool TYPE REF TO zif_trcktrsr_minion_tool .
    METHODS introduce
      RETURNING
        VALUE(intro) TYPE string .
  PROTECTED SECTION.

    DATA:
          n_o_eyes TYPE i.
    METHODS:
      set_n_o_eyes
        IMPORTING i_eyes TYPE i.
  PRIVATE SECTION.
    DATA:
      name TYPE string,
      tool TYPE REF TO zif_trcktrsr_minion_tool.

ENDCLASS.



CLASS ZCL_TRCKTRSR_MINION_BASE IMPLEMENTATION.


  METHOD banana.
    r_banana = c_banana.
  ENDMETHOD.


  METHOD get_name.
    r_result = me->name.
  ENDMETHOD.


  METHOD get_n_o_eyes.
    r_result = me->n_o_eyes.
  ENDMETHOD.


  METHOD get_tool.
    r_result = me->tool.
  ENDMETHOD.


  METHOD introduce.
    DATA:
      sound TYPE REF TO zif_trcktrsr_minion_sound,
      evil  TYPE REF TO zif_trcktrsr_minion_evil.

    intro = |Hello, my name is { me->name } and I have { me->get_n_o_eyes_as_text( ) }. |.
    IF me->tool IS BOUND.
      intro = intro && |I have a { tool->name }. |.

      IF tool IS INSTANCE OF zif_trcktrsr_minion_sound.
        sound ?= tool.
        intro = intro && |It makes { sound->sound( ) } |.
      ENDIF.

    ENDIF.
    TRY.
        evil ?= me.
        intro = intro && 'I AM EVIL!'.
      CATCH cx_sy_move_cast_error.
        intro = intro && me->banana( ).
    ENDTRY.

  ENDMETHOD.


  METHOD set_name.
    me->name = i_name.
  ENDMETHOD.


  METHOD set_n_o_eyes.
    me->n_o_eyes = i_eyes.
  ENDMETHOD.


  METHOD set_tool.
    me->tool = i_tool.
  ENDMETHOD.
ENDCLASS.
