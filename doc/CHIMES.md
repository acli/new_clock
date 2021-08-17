Chime options
=============
Unlike Javascript (or Python), there is no native support in Perl to process audio.
The script currently uses [mpv](http://mpv.io) to play audio recordings,
and multiple copies of mpv are needed to play a chime melody.
This is clearly not ideal since resource usage is unpredictable
so there’s both a danger of thrashing and audio distortion.

Gong options
------------
https://freesound.org/people/strangehorizon/packs/32761/
- pros: the whole scale, public domain (cc0)
- cons: need lots of mpv subprocesses to play chime melodies

Bell options
------------
We can use gongs, but it sounds a little off

https://www.fluidsynth.org/
- pros: one subprocess only for each sink
- cons: if we have more than one sink configured, running two copies of fluidsynth at the same time will cause massive distortion.
  It might be possible to pre-generate a sound file and then use mpv to play that pregenerated file when an event fires.
- fluidsynth numbers seem to be off by one in bank 0, 0-14 is tubular bells, 8-14 is church bells (doesn't really work, it strikes twice)

https://freesound.org/people/sandyrb/packs/6993/
- pros: fairly clear, cc-by-3.0, Canadian
- cons: possibly too loud (possible distortion), 15-semitone range not enough for Westminster chimes

https://freesound.org/people/Samulis/packs/21054/
- pros: very clear, public domain (cc0)
- cons: not enough range (only 4 notes)

https://freesound.org/people/Samulis/packs/12231/
- pros: very clear, cc-by-3.0, little to no distortion even with the f (loud) samples
- cons: not enough range in version on Freesound
  (will investigate full [VSCO library on main site](https://vis.versilstudios.com/vsco-community.html))


Wood options
------------
using MIDI drum kit:
- 31 (sticks)
- 60 (high bongo)
- 61 (low bongo)
- 76 (high wood block)
- 77 (low wood block)

https://freesound.org/people/Theriavirra/sounds/269735/
https://freesound.org/people/Theriavirra/sounds/269750/
- relatively long enough

https://freesound.org/people/Theriavirra/sounds/319918/
- possibly too short

https://freesound.org/people/Theriavirra/sounds/269738/
- too short

https://freesound.org/people/Seidhepriest/sounds/234364/
- cons: nc


Cuckoo options
--------------
https://freesound.org/people/acclivity/sounds/19561/
- pros: *very* clear cuckoo sound
- cons: cc-by-nc-3.0

https://freesound.org/people/inchadney/sounds/121203/
- pros: clear cuckoo sound, cc-by-3.0
- cons: maybe a little soft
- citation: Walter, T. [Thomas]. 2011. Birds: Cuckoo.wav [Audio file].
  Retrieved from https://freesound.org/people/inchadney/sounds/121203/

https://freesound.org/people/reinsamba/sounds/35053/
- pros: clear cuckoo sound, cc-by-3.0
- cons: it's somewhat a little too uneven

https://freesound.org/people/CaganCelik/sounds/435205/
- pros: clear birdsong, public domain (cc0)
- cons: doesn't sound like the stereotypical cuckoo

https://freesound.org/people/jgrzinich/sounds/364983/
- pros: clear cuckoo sound
- cons: cc-by-nc-3.0

https://freesound.org/people/RTB45/sounds/234921/
- pros: cc-by-3.0
- cons: noisy background (wind)


Chime melody options
--------------------
https://www.clockguy.com/SiteRelated/SiteReferencePages/ClockChimeTunes.html
- This page contains the actual melodies; the Wikipedia page for the Whittington chimes seems to be a word-for-word plagiarized copy
