#!/bin/sh
mkdir -p bin
cobc -o bin/out -x -free src/albol.cbl src/view-branch.cbl src/edit-branch.cbl \
 src/more-branch.cbl src/add-branch.cbl src/trac-branch.cbl