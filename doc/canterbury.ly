\version "2.18.2"

\markup {see Starmer (1907, p. 14)}

x = { \key c \major \omit Staff.TimeSignature \time 14/1 }
\relative c' { \x	g'1 a c }
\relative c' { \x	g'1 a c \breathe d c b c }
\relative c' { \x	g'1 a c \breathe d c b c \breathe c b g }
\relative c' { \x	g'1 a c \breathe d c b c \breathe c b g \breathe a c d c }
\relative c' { \x	cis1 }
