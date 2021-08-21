Working draft on notes on the citation file format
==================================================
These is a working draft for notes on the citation file format.
Currently it serves to document [decisions](../CITATION.cff) I made
[translating APA-style citations to the citation file format](../utils/merge-citation-cff).
Eventually it should evolve into a guide on the various fields in the *reference* field.

(Note that the source citations often have `<span title="full name">` or `<cite>` elements
to help the generator. The generator has no special knowledge of these things.)

Scenario: Soundfont as dependency
---------------------------------
Dependency mention (source: [README.md](README.md)):

> The \[Timbres of Heaven](http://midkar.com/soundfonts/) soundfont by Don Allen

APA citation (using custom type “Soundfont”), as currently generated:

> Allen, <span title="Don">D.</span> (n.d.). Timbres of Heaven (Soundfont). Retrieved from http://midkar.com/soundfonts/

CFF citation, as currently generated:

    - authors:
      - family-names: Allen
        given-names: Don
      title: "Timbres of Heaven"
      type: sound-recording
      url: "http://midkar.com/soundfonts/"

Unresolved question:

- Is a soundfont a kind of software? sound-recording? dataset? something else?

Scenario: Perl module as dependency
-----------------------------------
Dependency mention (source: [README.md](README.md)):

> \[DateTime::Astro::Sunrise](https://metacpan.org/release/RKHILL/DateTime-Astro-Sunrise-0.01_01)

APA citation, as currently generated:

> DateTime::Astro::Sunrise [Computer software]. (n.d.) Retrieved from https://metacpan.org/release/RKHILL/DateTime-Astro-Sunrise-0.01_01

CFF citation, as currently generated:

    - title: "DateTime::Astro::Sunrise"
      type: software
      url: "https://metacpan.org/release/RKHILL/DateTime-Astro-Sunrise-0.01_01"

Peculiarities:

- This isn’t really a hard dependency, but one option for a hard dependency if you choose to go this path

Unresolved question:

- Is there currently a way to specify an anyOf relationship in a dependency? Should there be a way?

Scenario: Software dependency with a minimum version number
-----------------------------------------------------------
Dependency mention (source: [README.md](README.md)):

> \[Perl](https://www.perl.org/) 5 with Unicode support (version 5.14 or later)

APA citation, as currently generated:

> Perl (Version 5.14) [Computer software]. (n.d.) Retrieved from https://www.perl.org/

CFF citation, as currently generated:

    - title: Perl
      version: 5.14
      type: software
      url: "https://www.perl.org/"

Peculiarities:

- Anyone used to reading (e.g., APA style) reference lists would interpret this to mean we are *using* version 5.14, which is untrue

Unresolved questions:

- Should there be a new field that tells the reader that this is a minimum requirement, as opposed to the software that is actually being by the author?
- Or, should the schema be changed so that *version* always means a minimum requirement?

Scenario: Individual web page
-----------------------------
APA citation (source: [embedded in source code](../chimer)):

> General MIDI instrument codes. (n.d.).
> Retrieved August 20, 2021, from http://www.ccarh.org/courses/253/handout/gminstruments/

CFF citation, as currently generated:

    - title: "General MIDI instrument codes"
      date-accessed: 2021-08-20
      url: "http://www.ccarh.org/courses/253/handout/gminstruments/"

Unresolved questions:

- What *type* to use? `website` just sounds wrong, but this isn’t an `article`
- If we use `website`, should *title* mean the site name? If so should the page title be a *section*?

Scenario: Library of edited sound clips
---------------------------------------
Annotated APA citation (source: [CREDITS.md](CREDITS.md))
(note that I’m clearly using the wrong type here already):

> [Gossner, <span title=Samuel>S.</span>](http://sgossner.versilstudios.com/), ed. (2019).
> Versilian Community Sample Library [Audio file].
> Retrieved from https://github.com/sgossner/VCSL
> - These recordings are public domain (cc0) and are used for Westminster-style chimes …

CFF citation, as currently generated:

    - authors:
      - family-names: Gossner
        given-names: Samuel
        url: "http://sgossner.versilstudios.com/"
      year: 2019
      title: "Versilian Community Sample Library"
      type: sound-recording
      repository-code: "https://github.com/sgossner/VCSL"
      license: CC0-1.0

Peculiarities:

- Edited work, unknown list of authors (where in normal citation styles we’d use “et al.” as a workaround)
- Not really one sound recording but an organized collection of sound recordings

Unresolved questions:

- Is a package of `sound-recording`s itself a `sound-recording`?
- Gossner’s role isn’t really author. He is one of the authors (full list of authors is *unknown*), but it’s most accurate to call him editor
- Should the schema handle cases where it’s impossible to avoid “et al.”?
- Should *authors* be not required, or should `required` be anyOf authors, editors (not just authors)?

Scenario: Blog post
-------------------
APA citation (source: [CHIMES.md](CHIMES.md)):

> Li, <span title=Ambrose>A.</span> (2018, January 8).
> sysline beeps are music, or the multisensory Unix text mode interface [Weblog post].
> Retrieved from http://incd.ambroseli.ca/node/308

CFF citation, as currently generated:

    - authors:
      - family-names: Li
        given-names: Ambrose
      year: 2018
      month: 1
      day: 8
      title: "sysline beeps are music, or the multisensory Unix text mode interface"
      type: blog
      url: "http://incd.ambroseli.ca/node/308"

Note:
- In the current schema, `blog` means an individual blog post, not the entire blog

Scenario: Journal or magazine article
-------------------------------------
APA citation (source: [Night_watches.md](Night_watches.md)):

> Lin, <span title="Tsung-Yi">T.-Y.</span> (2007).
> 午時三刻⸺古中國的時間制度
> [“Three after seven”? Systems for timekeeping in ancient China].
> <cite>Science Development</cite>, 420, 58–63.
> Retrieved from https://ejournal.stpi.narl.org.tw/sd/view?vlId=E8E36F2F-73CB-4924-8F5F-D18489D89422

CFF citation, as currently generated:

    - authors:
      - family-names: Lin
        given-names: Tsung-Yi
      year: 2007
      title: "午時三刻⸺古中國的時間制度 [“Three after seven”? Systems for timekeeping in ancient China]"
      type: article
      journal: "Science Development"
      issue: 420
      start: 58
      end: 63
      url: "https://ejournal.stpi.narl.org.tw/sd/view?vlId=E8E36F2F-73CB-4924-8F5F-D18489D89422"

Peculiarities:

- Non-English title
- Page that links to the final PDF is not specific to the article being cited

Unresolved question (for all citation styles, not just the citation file format):
- Should we link to the actual PDF, or, as above, link to the page that links to the PDF, even if that page is a table of contents for the entire issue?

Scenario: Section in online manual
----------------------------------
APA citation (source: [embedded in source code](../chimer)):

> Percussion notes. (n.d.). In *LilyPond — Notation Reference v2.22.1 (stable-branch)*.
> Retrieved August 20, 2021, from http://lilypond.org/doc/v2.22/Documentation/notation/percussion-notes

CFF citation, as currently generated:

    - section: "Percussion notes"
      title: "LilyPond — Notation Reference v2.22.1 (stable-branch)"
      type: book
      date-accessed: 2021-08-20
      url: "http://lilypond.org/doc/v2.22/Documentation/notation/percussion-notes"

Peculiarities:

- No author, no date
- The manual is not the entire site

Unresolved questions:

- Is an online manual a `book`? something else?
- Furthermore, is a chapter in a `book` a *section*?
- If an online manual is not a `book`, is it just a random web page? If that’s the case we go back to the question of how to handle random individual pages
