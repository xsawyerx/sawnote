# sawnote

Sawyer's guitar notation - a very short notation for guitar tabs and a parser to create pretty tabs

The notation:

* Note: "string by number" : "position on string" (`1:3` - 1st string, 3rd position) (Supported)
* Next or extra space: `>` (Supported)
* Combination: `+` (Supported)
* Slide down: `\\` (Supported)
* Slide up: `/` (Supported)
* Hammer: `h` (Supported)
* Pull-off: `p` (Supported)
* Vibrate: `v` (Supported)
* Header: Anything starting with `#` (Supported)
* Combination alternateive: `CLLLLLL` (`L` position on string from 1 to 6, `x` for "blocked") (Not supported)
* Chords: Chord name in uppercase (`C`, `F#`, `B7`, etc.) (Not supported)
* Repetition: `\s X \s* [0-9]+ $` (Not supported)
