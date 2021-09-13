Chiming
=======
I see chiming clocks as a kind of sonic interface (Li, 2018).
My original chiming clock reproduced
the half-hour beeps produced by [*sysline*](sysline.md) (a now-uncommon Unix
program) using Javascript and required a browser to run. At that time,
WebAudioAPI was still somewhat of a “first-class object” –
at least some browsers wouldn’t actively sabotage audio. Soon
after I made this first applet, I wrote a second one, based on this
first one, that announces [night watches](Night_watches.md).

By 2020, the WebAudioAPI scene had become drastically different. Browsers now
actively block audio, on the misguided idea that this
could solve the “unwanted audio” problem
(even though things like cookie notices had long rendered audio blocking worse than useless).
Doing chiming with web applets was no longer an attractive option.
Also, because two different
applets were producing two kinds of unrelated chimes,
the result was often “illegible” sonic output.
A replacement was in order.

I chose Perl for the rewrite out of laziness.
But unlike Javascript (or Python), Perl has no native support for audio.
The new code currently uses [mpv](http://mpv.io) to play audio recordings,
and multiple copies of mpv are needed to play a chime melody.
This is clearly not ideal since resource usage is unpredictable
so there’s both a danger of thrashing and audio distortion.


Chime melodies
==============
The script’s actual chime melodies have been sourced from Wikipedia
(“Westminster Quarters”, 2021; “Whittington chimes”, 2021)
and an out-of-copyright paper by Starmer (1907).

The Whittington chimes actually has nothing to do with Whittington.
According to Wilson (2005, 2006),
the melody was originally called simply the “chime on 8 bells”,
even though it was originally a 6-bell chime
(actual composition lost).
The name “Whittington” only started to take off around 1900.
An 11-bell version, later composed specifically for St Mary Le Bow,
is described by Starmer (1907, p. 5).

Chime melody notation
=====================
The chime melodies for carillon mode
are currently encoded in a small subset of Lilypond notation,
partly because encoding melodies as arrays is cumbersome, and
partly because Lilypond notation might be reasonably accessible (Zahnke, 2020).
Some other sonic notifications –
specifically night watch announcements and sysline beeps in *synth* mode –
are also encoded in this notation.

Before the encoded melodies can be used,
the code converts them to an internal data structure by calling the function *interpret_melody*.
This function currently only understands the commands **\relative**, **\drums**, **\tempo**, **\tuplex**,
**\set Staff.instrumentName**
and basic expressive marks (**\ppp**, **\pp**, **\p**, etc.).
In particular, **\laisserVibrer** is not understood;
whether to *laisser vibrer* is currently hard-coded as a hack.
Ties are understood, but slurs are ignored.
**\breathe** and **\time** are ignored.

Absolute mode is not supported,
but the scripts’s understanding of relative mode is not guaranteed to be correct.
If a score typesets correctly in Lilypond but *interpret_melody* converts it incorrectly
(you can check this using the **--test-tune** command-line option),
the bug is in *interpret_melody*.

Most percussive notes are understood and are mapped to the corresponding MIDI percussion instrument.

Ideally, the code will later be modified so that the same notation will be used in *samples* mode
so that there can be consistency.

Chime synthesis
===============
The current recommended method to generate chimes is to use fluidsynth,
ideally with the Timbres of Heaven soundfont.
The synth code always uses only one soundfont (either Timbres of Heaven or FluidR3);
it is not currently possible to mix-and-match instruments from different soundfonts.

The result of synthesis is saved into an .oga (OGG audio) file in the data directory,
for later playback using mpv.

The following were noted when synthesis was originally explored:
- pros: one subprocess only for each sink
- cons: if we have more than one sink configured, running two copies of fluidsynth at the same time will cause massive distortion.
  It might be possible to pre-generate a sound file and then use mpv to play that pregenerated file when an event fires.

The following options were originally explored:

Gong options
------------
- drum kit note 57 (crash cymbal 2) – sounds good
- drum kit note 52 (Chinese cymbal) – would be appropriate

Wood options
------------
- drum kit note 31 (sticks)
- drum kit note 60 (high bongo)
- drum kit note 61 (low bongo)
- drum kit note 76 (high wood block)
- drum kit note 77 (low wood block)
- drum kit note 75 (claves) – sounds good

Sample-based chiming
====================
Chimes were originally played using samples that were mostly sourced from freesound.
The code still exists
but has not been used in a long while
so sample-based chiming might or might not still work.

The following options were originally explored:

Gong options
------------
https://freesound.org/people/strangehorizon/packs/32761/
- pros: the whole scale, public domain (cc0)
- cons: need lots of mpv subprocesses to play chime melodies

Bell options
------------
We can use gongs, but it sounds a little off

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


References
==========
Harrison, <span title=Daniel>D.</span> (2000, October).
Tolling Time.
<cite>Music Theory Online, 6</cite>(4), Article 6.4.1.
Retrieved September 10, 2021, from https://www.mtosmt.org/issues/mto.00.6.4/mto.00.6.4.harrison.html

Li, <span title=Ambrose>A.</span> (2018, January 8).
sysline beeps are music, or the multisensory Unix text mode interface [Weblog post].
Retrieved from http://incd.ambroseli.ca/node/308

Oliver, <span title=Richard>R.</span> (n.d.).
Clock Chime Tunes: History and Examples You Can Hear.
Retrieved September 10, 2021, from https://www.clockguy.com/SiteRelated/SiteReferencePages/ClockChimeTunes.html

Starmer, <span title="William Wooding">W. W.</span> (1907, November 19). Chimes. <cite>Proceedings of the Musical Association, 34</cite>, 1–24.
Retrieved from https://ia800708.us.archive.org/view_archive.php?archive=/22/items/crossref-pre-1909-scholarly-works/10.1093%252Fjhered%252Fos-3.1.263.zip&file=10.1093%252Fjrma%252F34.1.1.pdf

Westminster Quarters. (2021). <cite>Wikipedia</cite>.
Retrieved August 18, 2021, from https://en.wikipedia.org/w/index.php?title=Westminster_Quarters&oldid=1038660380

Whittington chimes. (2021). <cite>Wikipedia</cite>.
Retrieved August 18, 2021, from https://en.wikipedia.org/w/index.php?title=Whittington_chimes&oldid=1039122189

Wilson, <span title=Steve>S.</span> [@SrWilson]. (2005, February 12). The actual melody
which became later known as the whittington chimes is much older than the westminster chimes [Reply to forum post].
Retrieved September 1, 2021, from https://mb.nawcc.org/threads/when-did-the-whittington-chime-get-developed.17426/

Wilson, <span title=Steve>S.</span> [@SrWilson]. (2006, August 9). I think I know what your clock does [Reply to forum post].
Retrieved September 1, 2021, from https://mb.nawcc.org/threads/jauch-grandfather-movement-with-11-note-chime.27915/

Zahnke, <span title=Tyler>T.</span> (2020, January 25).
Hello, I am a totally blind composer, and I'v tweaked LilyPond so it's accessible for me [Facebook post].
Retrieved September 10, 2021, from https://www.facebook.com/groups/gnulilypond/permalink/10157912670783529/
