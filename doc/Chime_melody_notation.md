Chime melody notation
=====================
The script uses a small subset of Lilypond notation to encode sonic patterns.
This notation is currently used for carillon mode chime melodies (both Westminster and Whittington),
night watch announcements when using the **synth** method,
and sysline mode when using the **synth** method.

Conversion from Lilypond notation to the script’s internal data structure is performed by *interpret_melody*.
The only commands understood are **\relative**, **\drums**, **\tempo**, **\tuplex**,
and basic expressive marks (**\ppp**, **\pp**, **\p**, etc.).

Only relative mode is currently supported, but correctness is not guaranteed.
If a score typesets correctly in Lilypond but *interpret_melody* converts it incorrectly
(you can check this using the **--test-tune** command-line option),
the bug is in *interpret_melody*.

Most percussive notes are understood and are mapped to the corresponding MIDI percussion instrument.
