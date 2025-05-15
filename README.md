# ALBOL

**Albol** (stylized as *ALBOL*, a portmanteau of "album" and "COBOL") is a 2025
(surprisingly!) project written entirely in (GNU) COBOL. It is a command line
interactive utility that stores information about albums. It is available under
the GNU Public License Version 2 (see LICENSE.md for more).

## Features

Using Albol, it is possible to add albums to a library (containing an artist
and a title) and give them ratings. Based on these ratings and albums, it 
Albol generates statistics and rankings. Also, you can store individual tracks,
and connect them with albums.

## Vague Notes

Rating is supposed to range from 1.00 to 5.00. There are three significant
figures of precision available. A rating of 0 is interpreted as an absense of a
rating.

Similarly, " " is interpreted as an absence of a title or artist. Use "?" for
unknown titles or artists.

To cut a record, you ought to have the correct capitalization.