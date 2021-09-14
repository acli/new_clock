\version "2.18.2"

\markup { Source: Starmer (1907, p. 7) }

x = { \time 3/4 }
\relative c' { \x	e'4 d c | g2. }
\relative c' { \x	c'4 e d | g,2. | c4 d e | c2. }
\relative c' { \x	e'4 c d | g,2. | g4 d' e | c2. | e4 d c | g2. }
\relative c' { \x	c'4 e d | g,2. | c4 d e | c2. | e4 c d | g,2. | g4 d' e | c2.^\fermata }
\relative c' { \x	c1 }
