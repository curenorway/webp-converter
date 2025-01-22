#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: webp.sh <folder_path>"
    exit 1
fi

cd "$1"

find . -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.JPG" -o -name "*.JPEG" -o -name "*.PNG" \) -exec sh -c 'mkdir -p $(dirname "$1")/webp; cwebp -q 75 "$1" -resize 0 1400 -o "$(dirname "$1")/webp/$(basename "${1%.*}.webp")"' _ {} \;