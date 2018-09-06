# minion_dojo
Creating Minions to show the power of object inheritance and interfaces

This programming demonstration has been created in a 90 minutes code-dojo where a lot of developers had to fullfill the following tasks:

![minions](https://github.com/tricktresor/minion_dojo/blob/master/MinionLogo_Transparent.png)

Create minions!

Minions have one or two eyes.
They can make noises, sing, play and other things.
Minions have special equipment
* CARL has a megaphone
* BOB has a teddy bear
* STUART plays ukulele
* DAVE just smiles
Minions can become evil caused by the mutagen PX-41.

Use classes and interfaces and inheritance to create apropriate classes with some senseful beahviour.

![Minion overview](https://github.com/tricktresor/minion_dojo/blob/master/minions.png)

# Maics solution
Maic uses global classes and interfaces
Maic used an abstract base class (zcl_trcktrsr_minion_base) where one-eyed and two-eyed minions inherit from.
tools are implementing the interface  zif_trcktrsr_minion_tool.

# Ennos solution
Enno built a report with using local classes and interfaces only.
There are special classes for Dave, Carl and Evil minion.
The minion can dynamically created by entering the minions name.
