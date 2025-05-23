>>SOURCE FORMAT FREE
*> Copyright (C) 2025 D. Hargitt
*> This program has been made available under the GNU General Public License.
*> It is distributed WITHOUT ANY WARRANTY. See LICENSE.md for details.

IDENTIFICATION DIVISION.
PROGRAM-ID. ADD-BRANCH.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT ALBUM-LIST-FILE ASSIGN TO "album-list.txt"
        ORGANIZATION IS SEQUENTIAL
        FILE STATUS IS FILE-STATUS-CODE.

DATA DIVISION.
FILE SECTION.
    FD ALBUM-LIST-FILE.
        01 ALBUM-RECORD.
            03 ALBUM-TITLE-RECORD PICTURE X(50).
            03 ALBUM-ARTIST-RECORD PICTURE X(50).
            03 ALBUM-RATING-RECORD PICTURE 9V99.
            03 ALBUM-RECORD-NEWLINE PICTURE X VALUE X"0A".

WORKING-STORAGE SECTION.
    01 ALBUM-TITLE PICTURE X(50).
    01 ALBUM-ARTIST PICTURE X(50).
    01 ALBUM-RATING PICTURE 9.99.
    01 FILE-STATUS-CODE PICTURE XX.
    01 EOF PICTURE X.
        88 EOF-REACHED VALUE 'Y'.
        88 EOF-NOT-REACHED VALUE 'N'.

PROCEDURE DIVISION.
ADD-BRANCH.
    DISPLAY "ADD ALBUM RECORD FUNCTION."
    PERFORM LINE-SPLIT
    DISPLAY "INPUT A TITLE."
    PERFORM LINE-SPLIT
    ACCEPT ALBUM-TITLE
    PERFORM LINE-SPLIT
    DISPLAY "INPUT AN ARTIST."
    PERFORM LINE-SPLIT
    ACCEPT ALBUM-ARTIST
    PERFORM LINE-SPLIT
    DISPLAY "INPUT A RATING."
    PERFORM LINE-SPLIT
    ACCEPT ALBUM-RATING

    PERFORM LINE-SPLIT

    OPEN INPUT ALBUM-LIST-FILE

    MOVE 'N' TO EOF
    PERFORM UNTIL EOF-REACHED
        READ ALBUM-LIST-FILE
            AT END MOVE 'Y' TO EOF
            NOT AT END IF FUNCTION LOWER-CASE(ALBUM-TITLE-RECORD) EQUAL
                    FUNCTION LOWER-CASE(ALBUM-TITLE)
                DISPLAY "RECORD ALREADY EXISTS."
                PERFORM LINE-SPLIT
                CLOSE ALBUM-LIST-FILE
                EXIT SECTION
            END-IF
    END-PERFORM

    CLOSE ALBUM-LIST-FILE

    OPEN I-O ALBUM-LIST-FILE

    MOVE 'N' TO EOF
    PERFORM UNTIL EOF-REACHED
        READ ALBUM-LIST-FILE
            AT END MOVE 'Y' TO EOF
            NOT AT END IF ALBUM-TITLE-RECORD EQUAL " "
                MOVE ALBUM-TITLE TO ALBUM-TITLE-RECORD
                MOVE ALBUM-ARTIST TO ALBUM-ARTIST-RECORD
                MOVE ALBUM-RATING TO ALBUM-RATING-RECORD
                REWRITE ALBUM-RECORD
                CLOSE ALBUM-LIST-FILE
                DISPLAY "SUCCESS."
                PERFORM LINE-SPLIT
                EXIT SECTION
            END-IF
    END-PERFORM

    CLOSE ALBUM-LIST-FILE

    INITIALIZE ALBUM-RECORD
    MOVE ALBUM-TITLE TO ALBUM-TITLE-RECORD
    MOVE ALBUM-ARTIST TO ALBUM-ARTIST-RECORD
    MOVE ALBUM-RATING TO ALBUM-RATING-RECORD
    MOVE X"0A" TO ALBUM-RECORD-NEWLINE

    OPEN EXTEND ALBUM-LIST-FILE

    WRITE ALBUM-RECORD

    DISPLAY "SUCCESS."

    PERFORM LINE-SPLIT

    CLOSE ALBUM-LIST-FILE
    
    EXIT SECTION.

LINE-SPLIT.
    DISPLAY "====================================================".
