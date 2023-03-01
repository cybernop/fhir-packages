#!/bin/sh

targetdir="$1"
mkdir -p $targetdir

SCRIPT_DIR="$(dirname $0)"
for f in $( find "$SCRIPT_DIR" -type f -name '*.tgz' )
do
    filename=$(basename $f .tgz)
    dirname=$(echo "$filename" | sed -r "s/([a-z\.]+)-([a-z0-9\.-]+)/\1#\2/")
    outputdir="$targetdir/$dirname/"
    echo "extract $dirname"
    mkdir -p $outputdir
    tar -xzf $f -C $outputdir
done
