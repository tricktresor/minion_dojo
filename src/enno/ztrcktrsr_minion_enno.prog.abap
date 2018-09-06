REPORT ztrcktrsr_minion_enno.


SELECTION-SCREEN COMMENT /1(70) TEXT-i01.
PARAMETERS p_name   TYPE c LENGTH 20 DEFAULT 'DAVE'.
PARAMETERS p_banana TYPE i DEFAULT 3.

CLASS minion DEFINITION.
  PUBLIC SECTION.
    DATA number_of_eyes TYPE i.
    DATA number_bananas_eaten TYPE i.
    DATA name TYPE string.
    METHODS constructor
      IMPORTING
        name           TYPE clike
        number_of_eyes TYPE i.

    METHODS how_many_eyes RETURNING VALUE(eyes) TYPE i.
    METHODS speak RETURNING VALUE(text) TYPE string.
    METHODS banana RETURNING VALUE(banana) TYPE string.
    METHODS is_evil RETURNING VALUE(result) TYPE boolean_flg.
    METHODS eat_banana.
  PROTECTED SECTION.
    DATA i_am_evil TYPE boolean_flg.
ENDCLASS.

CLASS minion IMPLEMENTATION.
  METHOD constructor.
    me->number_of_eyes = number_of_eyes.
    me->name           = name.
  ENDMETHOD.
  METHOD how_many_eyes.
    eyes = me->number_of_eyes.
  ENDMETHOD.
  METHOD speak.
    text = 'banana'.
  ENDMETHOD.
  METHOD is_evil.
    result = i_am_evil.
  ENDMETHOD.

  METHOD banana.
    banana = |hawaba banana { me->number_bananas_eaten } boo! (I have eaten { me->number_bananas_eaten } bananas!)|.
  ENDMETHOD.
  METHOD eat_banana.
    ADD 1 TO number_bananas_eaten.
  ENDMETHOD.
ENDCLASS.


INTERFACE music.
  METHODS play RETURNING VALUE(song) TYPE string.
ENDINTERFACE.

INTERFACE noise.
  METHODS make_some_noise RETURNING VALUE(noise) TYPE string.
ENDINTERFACE.

CLASS dave DEFINITION INHERITING FROM minion.
  PUBLIC SECTION.
    METHODS constructor.
    METHODS speak REDEFINITION.
    INTERFACES music.
    INTERFACES noise.
ENDCLASS.

CLASS dave IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name = 'Dave' number_of_eyes = 2 ).
  ENDMETHOD.
  METHOD speak.
    text = 'banana ti amo!'.
  ENDMETHOD.

  METHOD music~play.
    song = 'pling-plong-pläng'.
  ENDMETHOD.
  METHOD noise~make_some_noise.
    noise = 'PLÖÖÖÖNG'.
  ENDMETHOD.
ENDCLASS.

CLASS carl DEFINITION INHERITING FROM minion.
  PUBLIC SECTION.
    METHODS constructor.
    INTERFACES noise.
ENDCLASS.

CLASS carl IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name = 'Carl' number_of_eyes = 1 ).
  ENDMETHOD.
  METHOD noise~make_some_noise.
    noise = 'MÖÖÖÖÖÖÖÖÖÖÖÖP'.
  ENDMETHOD.
ENDCLASS.


CLASS evil DEFINITION INHERITING FROM minion.
  PUBLIC SECTION.
    METHODS constructor.
ENDCLASS.

CLASS evil IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name = 'Evil minion' number_of_eyes = 2 ).
    i_am_evil = abap_true.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.

  DATA minion TYPE REF TO minion.
  TRY.
      CREATE OBJECT minion TYPE (p_name).
    CATCH cx_sy_create_object_error.
      MESSAGE 'Minion does not exist' TYPE 'S'.
      STOP.
  ENDTRY.

  IF minion->is_evil( ) = abap_true.
    WRITE: / minion->name, 'is evil'.
  ENDIF.

  DATA(text) = minion->speak( ).
  WRITE: / minion->name, 'says "' no-GAP, text no-gap, '"'.
  DATA(eyes) = minion->how_many_eyes( ).
  WRITE: / minion->name, 'has', eyes, 'eyes'.

  IF minion IS INSTANCE OF music.
    DATA minion_music TYPE REF TO music.
    minion_music ?= minion.
    DATA(song) = minion_music->play( ).
    WRITE: / minion->name, 'sings', song.
  ELSE.
    WRITE: / 'Minion does not make music'.
  ENDIF.

  IF minion IS INSTANCE OF noise.
    DATA minion_noise TYPE REF TO noise.
    minion_noise ?= minion.
    DATA(noise) = minion_noise->make_some_noise( ).
    WRITE: / minion->name, 'makes noise', noise.
  ELSE.
    WRITE: / 'Minion makes no noise'.
  ENDIF.

  DO p_banana TIMES.
    minion->eat_banana( ).
  ENDDO.

  WRITE: / minion->banana( ).
