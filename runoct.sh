#!/bin/sh

OCT_PATH="";
dir=`dirname $0`;
for i in $dir/*; do
    if [ -d $i ]; then
        OCT_PATH="$OCT_PATH -p $i/";
    fi
done
echo $OCT_PATH


octave $OCT_PATH
