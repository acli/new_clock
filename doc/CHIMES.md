Gong options
============
https://freesound.org/people/strangehorizon/packs/32761/
- pros: the whole scale, public domain (cc0)
- cons: need lots of mpv subprocesses to play chime melodies

https://www.fluidsynth.org/
- pros: one subprocess only for each sink
- cons: if we have more than one sink configured, running two copies of fluidsynth at the same time will cause massive distortion.
  It might be possible to pre-generate a sound file and then use mpv to play that pregenerated file when an event fires.
- fluidsynth numbers seem to be off by one in bank 0, 0-14 is tubular bells, 8-14 is church bells (doesn't really work, it strikes twice)

Wood options
============
using MIDI drum kit:
- 31 (sticks)
- 60 (high bongo)
- 61 (low bongo)
- 76 (high wood block)
- 77 (low wood block)

Cuckoo options
==============
https://freesound.org/people/acclivity/sounds/19561/
- pros: *very* clear cuckoo sound
- cons: cc-by-sa-nc

https://freesound.org/people/inchadney/sounds/121203/
- pros: clear cuckoo sound, cc-by-sa
- cons: maybe a little soft
- citation: Walter, T. [Thomas]. 2011. Birds: Cuckoo.wav [Audio file].
  Retrieved from https://freesound.org/people/inchadney/sounds/121203/

https://freesound.org/people/reinsamba/sounds/35053/
- pros: clear cuckoo sound, cc-by-sa
- cons: it's somewhat a little too uneven

https://freesound.org/people/CaganCelik/sounds/435205/
- pros: clear birdsong, public domain (cc0)
- cons: doesn't sound like the stereotypical cuckoo

https://freesound.org/people/jgrzinich/sounds/364983/
- pros: clear cuckoo sound
- cons: cc-by-sa-nc

https://freesound.org/people/RTB45/sounds/234921/
- pros: cc-by-sa
- cons: noisy background (wind)
