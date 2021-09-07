Chiming
=======
As described in my blog post I wrote in 2018, I see chiming clocks
as a kind of sonic interface. My original chiming clock reproduced
the half-hour beeps produced by *sysline* (a now-uncommon Unix
program) using Javascript and required a browser to run. At that time,
Javascript’s WebAudio was still somewhat of a “first-class object”
– at lease some browsers wouldn’t actively sabotage some audio. Soon
after I made this first applet, I wrote a second one, based on this
first one, that announces [night watches](Night_watches.md).

The WebAudio scene in 2020 was drastically different. Browsers now
actively suppress audio output, on the misguided idea that this
could solve the “unwanted audio” problem. Doing chiming with web
applets therefore is no longer appealing. Also, because two different
applets were producing two kinds of unrelated chimes, often we get
“illegible” sonic output. A replacement was in order.

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

using MIDI drum kit:
- 57 (crash cymbal 2) sounds good
- 52 (Chinese cymbal) would be appropriate

Bell options
------------
We can use gongs, but it sounds a little off

https://www.fluidsynth.org/
- pros: one subprocess only for each sink
- cons: if we have more than one sink configured, running two copies of fluidsynth at the same time will cause massive distortion.
  It might be possible to pre-generate a sound file and then use mpv to play that pregenerated file when an event fires.
- fluidsynth numbers seem to be off by one in bank 0, 0-14 is tubular bells, 8-14 is church bells (doesn't really work, it strikes twice)
  - 8-14 seems to work if we use MuseScore General

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
- 75 (claves) sounds good

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


References
----------
Westminster Quarters. (2021). <cite>Wikipedia</cite>.
Retrieved August 18, 2021, from https://en.wikipedia.org/w/index.php?title=Westminster_Quarters&oldid=1038660380

Whittington chimes. (2021). <cite>Wikipedia</cite>.
Retrieved August 18, 2021, from https://en.wikipedia.org/w/index.php?title=Whittington_chimes&oldid=1039122189

Li, <span title=Ambrose>A.</span> (2018, January 8).
sysline beeps are music, or the multisensory Unix text mode interface [Weblog post].
Retrieved from http://incd.ambroseli.ca/node/308
