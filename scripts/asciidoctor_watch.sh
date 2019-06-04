#!/bin/bash

# Watch for vim writes to .adoc files in current directory and subdirectories.
# On write, regenerate the file changed into the build directory.
#
# Author: Filip Smola

build="./build"

inotifywait -qrm --event close_write --format "%w%f" ./ |
    while read filename; do
        if [[ $filename != "$build"* ]]; then
            if [[ $filename == *".adoc" ]]; then
                out="$build/${filename%.adoc}.html"
                asciidoctor -r asciidoctor-diagram -b html -o $out $filename
                echo "Regenerated $filename into $out"
            fi
        fi
    done
