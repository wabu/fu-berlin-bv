#!/bin/sh

OCT_PATH="";
for i in *; do
    if [ -d $i ]; then
        OCT_PATH="$OCT_PATH -p $i/";
    fi
done
echo $OCT_PATH


octave $OCT_PATH
