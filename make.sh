#!/bin/sh
cobc -o ./bin/out -x -F src/albol.cbl src/view-branch.cbl src/edit-branch.cbl \
src/more-branch.cbl