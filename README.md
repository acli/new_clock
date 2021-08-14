This script sounds Westminster-style chimes every quarter hour.
In addition,
between sundown and sunrise,
it sounds chimes every 1/5 of a night watch (0.2 proportional decimal hours)
according to old Shang-era rules for calculating proportional decimal hours.

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

Sound files
-----------
I’ve decided to not check in any of the sound files because they are too large.
Please get them yourself from the links listed in the CREDITS file,
place the wav files in the “raw” directory and run make to generate the mp3 files.
(mpv must be installed.)

One of these sound files is licensed through Creative Commons (CC-by-sa).
For details please see [the CREDITS file](doc/CREDITS.md).
