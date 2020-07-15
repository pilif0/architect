#!/usr/bin/env bash

# (Very) simple build system for LaTeX documents with Tex Live
#
# Author: Filip Smola

dir="./build"
file="main"

function build() {
    pdflatex -draftmode --output-directory $dir "$file.tex"
    bibtex "$dir/$file"
    pdflatex -draftmode --output-directory $dir "$file.tex"
    pdflatex --output-directory $dir "$file.tex"
}

function clean() {
    rm "$dir/"*
}

function watch() {
    inotifywait -qm --event close_write --format "%w%f" ./ |
        while read filename; do
            if [[ $filename != "$dir"* ]]; then
                if [[ $filename == *".tex" ]]; then
                    build
                fi
                if [[ $filename == *".bib" ]]; then
                    build
                fi
            fi
        done
}

function usage() {
    cat << EOF
Simple LaTeX build system.

USAGE:
    printer.sh [options] action

OPTIONS:
    -d <value>          Set the output director
                        Default is "./build"
    -f <value>          Set document file name (without extension)
                        Default is "main"
    -h                  Print this message

ACTIONS:
    clean               Cleans the build directory
    build               Builds the document
    watch               Continually rebuilds the document on write
EOF
}

if [[ $# -gt 0 ]]; then
    # Consume options first
    while [ -n "$1" ]; do
        case "$1" in
            -d) # change output directory
                dir="$2"
                shift
                ;;
            -f) # change file name
                file="$2"
                shift
                ;;
            -h) # print usage
                usage
                ;;
            *)
                shift
                break
                ;;
        esac

        shift
    done

    # Pick action
    case $1 in
        clean)
            clean
            ;;
        build)
            build
            ;;
        watch)
            watch
            ;;
    esac
else
    usage
fi
