# ALBOL

**Albol** (stylized as *ALBOL*, a portmanteau of "album" and "COBOL") is a 2025
(surprisingly!) project written entirely in (GNU) COBOL. It is a command line
interactive utility that stores information about albums. It is available under
the GNU Public License Version 2 (see LICENSE.md for more).

![logo](ALBOL.png)

## Features

Using Albol, it is possible to add albums to a library (containing an artist
and a title) and give them ratings. Based on these ratings and albums, it 
Albol generates statistics. Also, you can store individual tracks,
and connect them with albums.

## To Run

The first step to run Albol is to compile it. The provided `make.sh` file can
be used for this purpose. It depends on the GnuCOBOL compiler (check if it
exists using the command `cobc`). After running it, execute the file located at
`./bin/out` from the location where you want your record file (`album-list.txt`
to be stored).

## Vague Notes

Rating is supposed to range from 1.00 to 5.00. There are three significant
figures of precision available. A rating of 0 is interpreted as an absense of a
rating.

Similarly, " " is interpreted as an absence of a title or artist. Use "?" for
unknown titles or artists.

To cut a record, you ought to have the correct capitalization.