#!/bin/bash

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
fi

column=$1
file=${2:-/dev/stdin}

awk -F"," -v col="$column" 'NR > 1 {sum += $col; count++} END {if (count > 0) print sum / count;}' "$file"
