\version "2.18.2"

\header {
	title = "Whittington Chimes 12-bell version"
	subtitle = "(see Starmer, 1907, p. 5, but for timings cf. Heath, 2011)"
	composer = "Charles Villiers Stanford, 1905"
	tagline = "transpose 1 semitone down to B"
}

x = {
	\key c \major
	\time 3/4 % \omit Staff.TimeSignature
	\override Score.BarNumber.break-visibility = ##(#t #t #f)
}

qi = \transpose c c'' { \x	\partial 4 c4 | g f e }
qii = \transpose c c'' { \x	c4 g f | e g d }
qiii = \transpose c c'' { \x	a,4 g, f, | e, g, d | c e d }
qiiii = \transpose c c'' { \x	c4 g f | e g d | c a, f, | e, g, d, ~d,2. ~ d,2. |
	\repeat volta 12 \alternative {
		\volta 1,2,3,4,5,6,7,8,9,10,11
			c,2.
	}{
		\volta 12
			c,2.
	}
}

\score {
	\new StaffGroup <<
		\new Voice {
			\section \sectionLabel "1st" \qi
			\section \sectionLabel "2nd" \qii
			\section \sectionLabel "3rd" \qiii
			\section \sectionLabel "4th" \qiiii
		}
		\new Voice { \clef bass \partial 4 s4 | s2. * 14 }
	>>
}
