# ALBOL

![Static Badge](https://img.shields.io/badge/License-GPL_2-red) ![Static Badge](https://img.shields.io/badge/No-AI-green) ![Static Badge](https://img.shields.io/badge/Version-1.1.0-yellow)

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
`./bin/out` from the location where you want your record files
(`album-list.txt`) to be stored.

## Miscellaneous Notes

Rating is supposed to range from 1.00 to 5.00. There are three significant
figures of precision available. A rating of 0 is interpreted as an absense of a
rating.

Similarly, " " is interpreted as an absence of a title or artist. Use "?" for
unknown titles or artists.

To cut a record, you ought to have the correct capitalization.

## Functions

Navigate through the menus by entering your selected option. Note that it
usually suffices to enter the four first characters of your selected option for
the system to recognize it.

### Add

Enter a unique album name, an artist, and a rating (0 for unrated). This will
create a record of this album. Rating should be 1.00 to 5.00. Album titles and
artists are **case-sensitive**.

### View

### Album

Enter the name of an album (not case-sensitive). You will receive its artist
and rating.

### Artist

Enter the name of an artist (not case-sensitive). You will receive a list of
all their albums (beautifully and painfully centered), their average rating,
and its standard deviation.

### List

A simple list of all albums and their artists. For statistics on all albums
execute more > stats.

### Edit

Input an album title. You will receive its details. You may choose to edit some
element of it. Entering the first character of the option suffices.

### Track

#### Add

Enter a unique pair of title and album and a track number (1-99). This will 
create the track.

#### Cut

Enter a pair of title and album, verify it is correct, and the track will be
removed in a similar way to albums being removed with more > cut.

#### List

Enter an album title. You will receive a list of all its tracks. If the tracks
are not correctly ordered by track number, execute more > sort.

### More

#### Empty

Will remove all albums and tracks.

#### Init

Will create the files necessary for Albol, if they do not yet exist. This is
necessary when first running the program.

#### Cut

Enter the name of an album (**case-sensitive**) and verify it is correct. Then,
it will be removed. (However, the space occupied by it in the record file will
not be removed, just emptied so that it can be reused.)

#### Sort

This sorts the record files. For `album-list.txt`, this is based on the titles
of the albums. For `track-list.txt`, it is based on the title of the albums,
and then the track number.

#### Stats

This gives statistics for the whole list of albums.

### Exit

Exits the application.
