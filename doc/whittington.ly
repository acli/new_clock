\version "2.18.2"

\header {
	title = "Whittington Chimes 8-bell version"
	subtitle = "(see Starmer, 1907, p. 7, but for timings cf. George, 2014)"
	composer = "Traditional"
	tagline = "Transpose up 3 semitones to E to match score originally used"
}

x = {
	\key c \major
	\time 9/4 %\omit Staff.TimeSignature 
	\override Score.BarNumber.break-visibility = ##(#t #t #f)
}
A = \transpose c c' { c'4 f b e a d g c2 }
B = \transpose c c' { a4 g f e d b c' c2 }
C = \transpose c c' { c'4 a f d b g e c2 }
D = \transpose c c' { d4 f a c' b g e c2 }
E = \transpose c c' { c'4 b a g f e d c2 }
S = \transpose c c' { c2 }
F = \transpose c c' { r4 }

\score {
	\new StaffGroup <<
		\new Voice {
			\x
			\section \sectionLabel "1st" \E
			\section \sectionLabel "2nd" \A\B
			\section \sectionLabel "3rd" \C\D\E
			\section \sectionLabel "4th" \A\B\C\D \time 1/4 \F \time 2/4 \repeat volta 2 { \S }
		}
		\new Voice { \clef bass s2. * 31 }
	>>
}
