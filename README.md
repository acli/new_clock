This script sounds [English-style chimes (Westminster, Whittington and others)](doc/CHIMES.md) every quarter hour.
Between sundown and sunrise,
it also sounds chimes every 1/5 of a [Chinese night watch](doc/Night_watches.md) (0.2 proportional decimal hours)
using traditional chiming patterns for night watches and
according to the old rule of one night watch equalling one decimal hour.

(I’ve tried to make some effort to prevent
the two kinds of chimes from clashing with each other.
Unfortunately this is not working.)

Certain runtime parameters can be configured through a [per-user config file](doc/chimerrc.example),
currently hard-coded to be $HOME/.chimerrc

Aims
----
This was hacked together to replace my two Javascript chiming clocks,
with the aims of avoiding using Firefox for clock chimes
and reducing sound distortion issues caused by RTP broadcasts.

Status
------
As of 2023, only carillon mode¹ with pre-generated synthesized audio files² is guaranteed to work,
and the only melody guaranteed to work is a modified version 
of the new Whittington chimes³ (composed by Charles Villiers Stanford in 1905, as transcribed by Starmers, 1907, p. 5);
this is my own setup, so if any showstopping bugs show up I’ll have to fix them.

In earlier versions of the code, quarter chimes and hourly strikes are separate events;
in the current code the two are still technically separate events but grouped together (as an Event_List)
to prevent their clashing together when latency prediction goes wrong.⁴

The code itself is a big mess. I tried to do it right, but I’m a terrible coder.

In my actual setup I’m back to RTP, RTP problems I had seems to be a hardware problem that I’ve now solved with a new switch.

At some point it should ultimately serve as the back-end of my genmon plugin that shows Chinese (and Hebrew) dates.

Running
-------
The script currently only runs on either PulseAudio- or JACK-based Linux system.
You also must have mpv and ffmpeg installed (see Dependencies below).

If you’re not running directly from a git clone,
you only need the script itself.

The best way to get sound working is to use Fluidsynth
with a copy of Timbres Of Heaven installed.
You also must have a `data` directory created to hold cached audio files.
Please see the [sample config file](doc/chimerrc.example).


Dependencies
------------
- [Pulseaudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)-
  or [JACK](https://jackaudio.org/)-based Linux system
- [Perl 5](https://www.perl.org/) with Unicode support (version 5.14 or later)
- [mpv](https://github.com/mpv-player/mpv)
  to play audio samples
- [ffmpeg](https://ffmpeg.org/)
  if you use cuckoo mode
  (see [my comments about ffmpeg](doc/ffmpeg.md))
- [hebcal](https://github.com/hebcal/hebcal)
  to guess geographical location
  (not needed if you specify your geographical location in the config file)
- [DateTime::Event::Sunrise](https://metacpan.org/pod/DateTime::Event::Sunrise),
  [DateTime::Astro::Sunrise](https://metacpan.org/release/RKHILL/DateTime-Astro-Sunrise-0.01_01),
  or [Astro::Sunrise](https://metacpan.org/pod/Astro::Sunrise),
  to calculate sunrise and sundown
  (not all three are equally tested)

If using *samples* method:
- Sound files listed in the [CREDITS file](doc/CREDITS.md)

If using *synth* method:
- [Fluidsynth](https://www.fluidsynth.org/)
- [Expect::Simple](https://metacpan.org/pod/Expect::Simple)
- [File::Format::RIFF](https://metacpan.org/dist/File-Format-RIFF)
- The [Timbres of Heaven](http://midkar.com/soundfonts/) soundfont by Don Allen

Please
place the wav files in the “raw” directory and run make to generate the mp3 files.
(mpv must be installed.)

One of these sound files is licensed through Creative Commons (CC-by-sa).
For details please see [the CREDITS file](doc/CREDITS.md).

Notes
-----
1. `mode = carillon`
2. `method = synth`
3. `melody = whittington11study`; note that this is *not* the same Whittington chimes you’ll find on most clocks
4. Which is all the time. I literally failed stats; I don’t know what I’m doing with these predictions.
