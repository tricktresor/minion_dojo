CLASS zcl_trcktrsr_minion_megaphone DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_trcktrsr_minion_tool .
    INTERFACES zif_trcktrsr_minion_sound .

    METHODS constructor .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TRCKTRSR_MINION_MEGAPHONE IMPLEMENTATION.


  METHOD constructor.
    me->zif_trcktrsr_minion_tool~name = 'Megaphon'.
  ENDMETHOD.


  METHOD zif_trcktrsr_minion_sound~sound.
    r_sound = 'Mööööp!'.
  ENDMETHOD.
ENDCLASS.
