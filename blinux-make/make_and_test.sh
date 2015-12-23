#!/bin/sh -x

IPWD=$PWD

# check that the manifest & associated files are in $PWD/mouli
if [[ ! -f mouli/manifest.json ]]
then
    echo "This version of bugs requires this project to be reconfigured, please run the matching SEED job."
    exit 1
fi

# Norm check
~/norme_deepthought.py rendu -score -nocheat -swap_traces -malloc >> ~/workspace/norm.dpr 2> ~/workspace/norm.note
cp norm.{dpr,note} mouli/

# make (1/2 - mouli)
[ -f mouli/Makefile ] && make -C mouli

# make (2/2 - student)
[ -f rendu/Makefile ] && make -C rendu $MAKE_RULE
cp -rn rendu/* mouli

# run bugs
cd mouli
bugs -version
bugs -out "graph txt xunit" -login $DBUSER -city $CITY

# retrieve run artifacts
cd $IPWD
cp mouli/trace.txt .
cp mouli/note.txt .
cp mouli/tests_report.xml .

# wipe mouli folder
if [ -z ${NODEL+x} ]
then
	rm -rf mouli
fi

