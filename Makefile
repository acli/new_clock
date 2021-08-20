# vi: set ai sm:
mp3_targets=$(patsubst raw/%.wav,data/%.mp3,$(wildcard raw/*.wav))
ogg_targets=$(patsubst raw/%,data/%,$(wildcard raw/*.ogg))

targets=$(mp3_targets) $(ogg_targets) CITATION.cff

all: $(targets)

clean:
	rm -f data/carillon-*.flac

test:
	tests/test_chimer

# Volume must be specified, otherwise mpv will convert at a random volume (whatever was used last)
# Unfortunately we can't hard-code a volume here because some files are too loud (some even distorted) at 100%
data/%.mp3: raw/%.wav config/%.volume
	mpv --volume "`cat config/$*.volume`" $< -o $@ --no-video

data/%: raw/%
	ln $< $@

CITATION.cff: config/CITATION.cff.in doc/*.md README.md utils/merge-citation-cff chimer
	utils/merge-citation-cff $(filter-out utils/%,$^) > $@

PHONEY: all clean test
DELETE_ON_ERROR:
