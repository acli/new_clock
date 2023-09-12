2023 refactoring plan
=====================
Objective: Partially take the thing apart and reconstruct it

Goals:
- events need to be somewhat self-aware what they are and intelligent enough to pick audio files themselves
- pre/quarter/post should be merged in a single, uninterrupted audio, so that pre/quarter clashing would never happen
- rescheduling watches should work, watches should not run into quarter events
- it should be possible for a musically trained ear to discern the *hour* in quarter chimes
- magic knowledge about mpv etc. should all be moved into the config file

Nice-to-haves:
- SC as an audio backend
- API for genmon

Log
===
Events
- There are two types of events, events scheduled, represented by an array of dicts, and audio events, represented by id's
- Events scheduled are now somewhat moved into a class
- Audio events are what's the real problem but have not yet been touched

