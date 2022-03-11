# sawnote

Sawyer's guitar notation - a very short notation for guitar tabs and a parser to create pretty tabs

The notation:

* `1:3` - 1st string, 3rd position
* `1:3>2:2` - 1st string, 3rd position, then 2nd string, 2st position
* `1:3>>2:2` - same as above, but with extra space in between
* `# Song name...` - Header above the notes listing
* `1:3+4:2` - Combination of note at the same time
* `L3002xx` - Alternative to combination of notes (not supported yet)
* `2h3` - Hammer on from 2 to 3
* `3p2` - Pull-off from 3 to 2
* `1:3v` - Vibrate on 3rd position in 1st string
* `/` or `\\` - slide up or down, respectively
* `C>F#>B7` - Chords by names (not supported yet)
* `... X 3` - `...` should be repeated 3 times (not supported yet)
