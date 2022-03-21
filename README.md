# sawnote

Sawyer's guitar notation - a very short notation for guitar tabs and a parser to create pretty tabs

## Example

Input:

```
# Godfather (intro)
2:9>1:9>1:12>1:11>1:9>1:12>1:9>1:11>1:9>2:10>2:12>2:9>>2:9>1:9>1:12>1:11>1:9>1:12>1:9>1:11>1:9>2:9>2:8>2:7

# Mama Said
1:1+4:0>2:3>3:2>1:1>2:3>3:2>1:3+4:0>2:3>3:2>1:1+4:0>2:3>3:2
```

Output:

```
Godfather (intro)
E|----9--12--11--9--12--9--11--9-----------------9--12--11--9--12--9--11--9----------
A|-9------------------------------10--12--9---9------------------------------9--8--7-
D|-----------------------------------------------------------------------------------
G|-----------------------------------------------------------------------------------
B|-----------------------------------------------------------------------------------
E|-----------------------------------------------------------------------------------

Mama Said
E|-1--------1--------3--------1-------
A|----3--------3--------3--------3----
D|-------2--------2--------2--------2-
G|-0-----------------0--------0-------
B|------------------------------------
E|------------------------------------
```

## The notation:

* `1:3` - 1st string, 3rd fret
* `1:3>2:2` - 1st string, 3rd fret, then 2nd string, 2st fret
* `1:3>>2:2` - same as above, but with extra space in between
* `# Song name...` - Header above the notes listing
* `1:3+4:2` - Combination of note at the same time
* `L3002xx` - Alternative to combination of notes
* `2h3` - Hammer on from 2 to 3
* `3p2` - Pull-off from 3 to 2
* `1:3v` - Vibrate on 3rd fret in 1st string
* `/` or `\\` - slide up or down, respectively
* `C>F#>B7` - Chords by names
  (Supported: A/Am/B/Bm/C/Cm/D/Dm/E/Em/F/Fm/G/Gm/A7/B7/D7/E7/G7)
* `C+6:3` - Override a chord with whatever notes you want
* `... X 3` - `...` should be repeated 3 times (not supported yet)
