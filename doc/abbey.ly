\version "2.18.2"

\markup { Source: Starmer (1907, p. 13) }

x = { \time 4/1 }
A = \relative { c''1 b d c }
B = \relative { c''1 b d e }
C = \relative { e''1 c d c }
D = \relative { a'1(c) d c }
S = \relative { g'1 }

\absolute {\x \A }
\absolute {\x \A\B }
\absolute {\x \A\B\C }
\absolute {\x \A\B\C\D }
\absolute {\x \S }
