This script is intended to replace my two Javascript chiming clocks,
with the aims to avoid using Firefox for clock chimes
and to reduce sound distortion issues caused by RTP broadcasts.

It’s still a work-in-progress but is already usable,
although it requires running many copies of mpv at the same time,
which can potentially be a problem.

At some point it should ultimately serve as the back-end of my genmon plugin that shows Chinese (and Hebrew) dates.

Sound files
-----------
I’ve decided to not check in any of the sound files because they are too large.
Please get them yourself from the links listed in the CREDITS file,
place the wav files in the “raw” directory and run make to generate the mp3 files.
(mpv must be installed.)

One of these sound files is licensed through Creative Commons (CC-by-sa).
For details please see [the CREDITS file](doc/CREDITS.md).
