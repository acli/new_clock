% vi: set sw=2 ai sm:
\version "2.18.2"

\markup {see Starmer (1907, p. 11)}

x = { \key c \major \omit Staff.TimeSignature \time 5/1 }

\markup { The first line is obvious. For the rest, who knows where the syllables are supposed to go... }
A = \relative c' { \x	a'1 g f e d }
B = \relative c' { \x	d1( e) a g f( | g) d( f) e d }
C = \relative c' { \x	d1( e f a) d,( | f a g e f) | d( e g f) d }
D = \relative c' { \x	a'1( e f g d | e f g) e( a) | d,( a' g f e | g f e) d a' }
S = \relative c' { \x	d1 }

\score {
  <<
    \new StaffGroup
    <<
    \new Voice = "pri" { \A \break \B \break \C \break \D \break \S }
    \new Lyrics \lyricsto "pri" {
      Ni -- si Do -- mi -- nus
      In __ ex -- i -- tu __ Is -- ra -- el
      Sur -- cum __ Cor -- da
      Glo -- ri -- a Pa -- tri
    }
    >>
  >>
}
