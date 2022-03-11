# sawnote

Sawyer's guitar notation - a very short notation for guitar tabs and a parser to create pretty tabs

The notation:

* Note: string : location
* Next: `>`
* Combination: `+`
* Combination alternateive: `CLLLLLL` (`L` location on string from 1 to 6, `x` for "blocked")
* Slide down: `\\`
* Slide up: `/`
* Hammer: `h`
* Pull-off: `p`
* Chords: Chord name in uppercase (`C`, `F#`, `B7`, etc.)
* Repetition: `\s X \s* [0-9]+ $`
