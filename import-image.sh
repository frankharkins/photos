# /usr/bin/sh

BASENAME=$(basename $1)
magick $1 -resize 120x120 -gravity center "images/thumbnails/$BASENAME"
cp $1 "images/full-res/$BASENAME"
