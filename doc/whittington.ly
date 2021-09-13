\version "2.18.2"

\markup {8-bell version (see “Whittington chimes”, 2021)}

x = { \key e \major \omit Staff.TimeSignature \time 8/4 }
A = \relative e' { e'4 fis, dis' gis, cis a b e, }
B = \relative e' { e'4 cis a fis dis' b gis e }
C = \relative e' { e'4 dis a gis cis b fis e }
D = \relative e' { fis4 a cis e dis b gis e }
E = \relative e' { e'4 dis cis b a gis fis e }
S = \relative e' { e2 }
F = \relative e' { r8 }

\absolute {\x \E }
\absolute {\x \A\B }
\absolute {\x \C\D\E }
\absolute {\x \A\B\C\D\F }

\markup { Guessed }
\absolute {\x \S }
