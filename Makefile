# vi: set ai sm:
targets=$(patsubst raw/%.wav,data/%.mp3,$(wildcard raw/*.wav))

all: $(targets)

data/%.mp3: raw/%.wav
	mpv $< -o $@ --no-video

PHONEY: all
DELETE_ON_ERROR:
