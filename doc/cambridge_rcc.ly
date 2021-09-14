\version "2.18.2"

\markup { Source: Starmer (1907, p. 7) }

x = { \time 7/1 \hide Staff.TimeSignature }
\relative c' { \x	d1 g(a) b(g) a(g) }
\relative c' { \x	d1 g a  b g  a g  | \time 6/1 a b a g e d }
\relative c' { \x	d1 g a  b g  a g  | \time 6/1 a b a g e d | \time 7/1 d g a b g a g }
\relative c' { \x	d1 g a  b g  a g  | \time 6/1 a b a g e d | \time 7/1 d g a b g a g | c a b g a g }

\markup { Guessed: }
\relative c' { \x	d1 }
