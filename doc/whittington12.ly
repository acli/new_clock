\version "2.18.2"

\markup {12-bell version (see Starmer, 1907, p. 5, but for timings cf. Heath, 2011)}
\markup {transpose 1 semitone down to B}

x = { \key c \major \omit Staff.TimeSignature }
\transpose c c'' { \x \time 3/4	\partial 4 c4 | g f e }
\transpose c c'' { \x \time 3/4	c4 g f | e g d }
\transpose c c'' { \x \time 3/4	a,4 g, f, | e, g, d | c e d }
\transpose c c'' { \x \time 3/4	c4 g f | e g d | c a, f, | e, g, d, ~d,2. ~ d,2. |
	\repeat volta 2 { \x \time 3/4	c,2. }
}
