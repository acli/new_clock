One source of latency comes from starting the audio player,
which requires the player to load,
and then the player needing to load the audio file.
We try to track and predict this, but prediction doesn’t always work.

One possible way to reduce this latency would be to pre-load the audio player
and the audio file, then start the audio at the scheduled time.
Two ways to do this are being explored:

1. Run *mpv* in paused state, then unpause it at the correct time.
Unfortunately it’s not clear how to unpause it other than trying to somehow send a space to it.
It doesn’t respond to signals.

2. Use some sort of library to handle the whole audio playing thing.
[MPV::Simple](https://metacpan.org/pod/MPV::Simple) (i.e., libmpv) was considered,
but according to [MPV’s notes on copyright](https://github.com/mpv-player/mpv/blob/master/Copyright)
JACK suppose is GPL and therefore missing from libmpv,
so libmpv can’t be used.

Other way to reduce this latency would be to make *chimer* an audio player itself.
This is probably technically possible with PulseAudio (by telling PulseAudio to load the audio then to play it)
but it’s not clear if this is possible with JACK.
