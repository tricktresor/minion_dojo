REPORT ztrcktrsr_minion_maic.

DATA:
  minions TYPE STANDARD TABLE OF REF TO zcl_trcktrsr_minion_base,
  minion  TYPE REF TO zcl_trcktrsr_minion_base.

DATA(minion1) = NEW zcl_trcktrsr_minion_one_eyed( ).
minion1->set_name( i_name = 'Carl' ).
minion1->set_tool( i_tool = NEW zcl_trcktrsr_minion_megaphone( ) ).

APPEND minion1 TO minions.

DATA(minion2) = NEW zcl_trcktrsr_minion_two_eyed( ).
minion2->set_name( i_name = 'Dave' ).
APPEND minion2 TO minions.

minion2 = NEW zcl_trcktrsr_minion_two_eyed( ).
minion2->set_name( i_name = 'Bob' ).
minion2->set_tool( i_tool = NEW zcl_trcktrsr_minion_teddy( ) ).
APPEND minion2 TO minions.

minion1 = NEW zcl_trcktrsr_minion_one_eyed( ).
minion1->set_name( i_name = 'Stuart' ).
minion1->set_tool( i_tool = NEW zcl_trcktrsr_minion_ukulele( ) ).
APPEND minion1 TO minions.

DATA(minione) = NEW zcl_trcktrsr_minion_evil( ).
minione->set_name( i_name = 'Hans' ).
APPEND minione TO minions.
LOOP AT minions INTO minion.
  WRITE: / minion->introduce( ).
ENDLOOP.
