class ZCL_TRCKTRSR_MINION_UKULELE definition
  public
  final
  create public .

public section.

  interfaces ZIF_TRCKTRSR_MINION_TOOL .
  interfaces ZIF_TRCKTRSR_MINION_SOUND .

  methods CONSTRUCTOR .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TRCKTRSR_MINION_UKULELE IMPLEMENTATION.


  METHOD constructor.
    me->zif_trcktrsr_minion_tool~name = 'Ukulele'.
  ENDMETHOD.


  METHOD zif_trcktrsr_minion_sound~sound.
    r_sound = 'Pling Pling!'.
  ENDMETHOD.
ENDCLASS.
