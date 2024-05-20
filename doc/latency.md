One source of latency comes from starting the audio player,
which requires the player to load,
and then the player needing to load the audio file.
We try to track and predict this, but prediction doesn’t always work.

Adverse effects
===============
In the original design, chimes on the hour
are broken into two parts:
the fourth-quarter chime (q0) followed by the correct number of hour strikes (h<i>n</i>).

In theory, this is correct and is a good way to avoid repeating ourselves.
Unfortunately, latency sometimes causes the hour strikes to begin before the fourth-quarter chime is finished.
When this happens, you often can’t tell which hour it is by listening.

In September 2023 the two were grouped together
(that is, q0 and each h<i>n</i> are no longer separate audio files,
but a single audio file q0,h<i>n</i>.
So in the current situation, in theory,
latency is no longer a real problem
unless you have two *chimer* instances running on two separate computers.

Reducing latency
================

One possible way to reduce this latency would be to pre-load the audio player
and the audio file, then start the audio at the scheduled time.
Two ways to do this are being explored:

1. Run *mpv* in paused state, then unpause it at the correct time.
Unfortunately it’s not clear how to unpause it other than trying to somehow send a space to it.
It doesn’t respond to signals.

2. Use some sort of library to handle the whole audio playing business.
[MPV::Simple](https://metacpan.org/pod/MPV::Simple) (i.e., libmpv) was considered,
but according to [MPV’s notes on copyright](https://github.com/mpv-player/mpv/blob/master/Copyright)
JACK support is GPL and therefore missing from libmpv,
so libmpv can’t be used.

Another way to reduce this latency would be to make *chimer* an audio player itself.
This is probably technically possible with PulseAudio (by telling PulseAudio to load the audio then to play it)
but it’s not clear if this is possible with JACK.
