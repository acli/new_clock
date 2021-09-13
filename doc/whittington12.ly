\version "2.18.2"

\markup {12-bell version (see Starmer, 1907, p. 5)}

x = { \key c \major \omit Staff.TimeSignature }
\relative c' { \x \time 4/4	c'4 g' f e }
\relative c' { \x \time 6/4	c'4 g' f e g d }
\relative c' { \x \time 9/4	a'4 g f e g d' c e d }
\relative c' { \x \time 12/4	c'4 g' f e g d c a f e g d }
\relative c' { \x \time 4/4	c1 }
