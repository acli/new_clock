ffmpeg
======

*ffmpeg* appears to be actually a general-purpose audio/video mixer-synthesizer
(it includes a sine wave generator, for example, as well as,
for example, fade-in/fade-out effects);
this does not seem to be mentioned very much, if at all,
probably because its documentation is very difficult to understand.

After a number of false starts,
I restarted with this segment of a level-two debug output:

    1631591999.73#  DEBUG: schedule: [0 [(play) (72699__benboncan__cuckoo) 0.05 10.65] 64]
    1631591999.73#  DEBUG: schedule: [0 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [1.71428571428571 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [3.42857142857143 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [5.14285714285714 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [6.85714285714286 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [8.57142857142857 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [10.2857142857143 [(play) (72699__benboncan__cuckoo) 0.05 10.65] 64]
    1631591999.73#  DEBUG: schedule: [10.2857142857143 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [12 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [13.7142857142857 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [15.4285714285714 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [17.1428571428571 (noteon 1 48 64)]
    1631591999.73#  DEBUG: schedule: [18.8571428571429 (noteon 1 48 64)]

Ignoring the MIDI notes, I tried to construct
an *ffmpeg* filter that would merge the cuckoo recording with a delayed copy of itself,
and (after a lot of trial-and-error) ended up with the following, which worked:

    cuckoo=data/72699__benboncan__cuckoo.wav
    ffmpeg \
	    -i "$cuckoo" \
	    -i "$cuckoo" \
	    -filter_complex '[0]atrim=0.05:10.65 [g0]; [1]atrim=0.05:10.65,adelay=10286 [g1]; [g0][g1] amix=inputs=2'  test.oga

Volume adjustments
------------------

Volume adjustments in *ffmpeg* can be written as fractions, e.g., 64/127,
which is great considering MIDI velocities range from 0 to 127.
However, volume adjustments appear to be global, so

	    [0]atrim=volume=64/127,0.05:10.65 [g0]; [1]atrim=volume=64/127,0.05:10.65,adelay=10286 [g1]; [g0][g1] amix=inputs=2

looks correct but produces incorrect results.
After the volume is turned down for input 0,
the volume is turned down *again* for input 1.

So apparently, this has to be written as

	    [0]atrim=volume=64/127,0.05:10.65 [g0]; [1]atrim=0.05:10.65,adelay=10286 [g1]; [g0][g1] amix=inputs=2

which looks incorrect but actually produces correct results.
