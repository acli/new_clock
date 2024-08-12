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
S = \transpose c c' { c1 }
F = \transpose c c' { \time 3/4 r2. \time 4/4 r1 }

\score {
	\new StaffGroup <<
		\new Voice {
			\x
			\section \sectionLabel "1st" \E
			\section \sectionLabel "2nd" \A\B
			\section \sectionLabel "3rd" \C\D\E
			\section \sectionLabel "4th" \A\B\C\D
			\F \repeat volta 12 \alternative { \volta 1,2,3,4,5,6,7,8,9,10,11 \S }{ \volta 2  \S }
		}
		\new Voice { \clef bass s2. * 31 s1 * 3 }
	>>
}
