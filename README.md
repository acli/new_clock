This script sounds Westminster-style chimes every quarter hour.
Between sundown and sunrise,
it also sounds chimes every 1/5 of a [Chinese night watch](doc/Night_watches.md) (0.2 proportional decimal hours)
using traditional chiming patterns for night watches and
according to the old rule of one night watch equalling one decimal hour.

The script makes some effort in preventing
the two kinds of chimes from clashing with each other.

Certain runtime parameters can be configured through a per-user config file,
currently hard-coded to be $HOME/.chimerrc

Aims
----
It’s intended to replace my two Javascript chiming clocks,
with the aims of avoiding using Firefox for clock chimes
and reducing sound distortion issues caused by RTP broadcasts.

Status
------
This is still a work-in-progress but is already usable,
although it requires running many copies of mpv at the same time,
which can potentially be a problem.

At some point it should ultimately serve as the back-end of my genmon plugin that shows Chinese (and Hebrew) dates.

Dependencies
------------
- [Pulseaudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)-based Linux system
- [Perl](https://www.perl.org/) 5 with Unicode support (version 5.14 or later)
- [mpv](https://github.com/mpv-player/mpv)
  to play audio samples
- [hebcal](https://github.com/hebcal/hebcal)
  to guess geographical location
  (not needed if you specify your geographical location in the config file)
- [DateTime::Event::Sunrise](https://metacpan.org/pod/DateTime::Event::Sunrise),
  [DateTime::Astro::Sunrise](https://metacpan.org/release/RKHILL/DateTime-Astro-Sunrise-0.01_01/view/Sunrise.pm),
  or [Astro::Sunrise](https://metacpan.org/pod/Astro::Sunrise),
  to calculate sunrise and sundown
  (not all three are equally tested)
- Sound files listed in the [CREDITS file](doc/CREDITS.md)
  (not provided because they are large and this is still a work-in-progress)

Please
place the wav files in the “raw” directory and run make to generate the mp3 files.
(mpv must be installed.)

One of these sound files is licensed through Creative Commons (CC-by-sa).
For details please see [the CREDITS file](doc/CREDITS.md).
