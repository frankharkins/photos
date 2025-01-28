# /usr/bin/sh

BASENAME=$(basename $1)
magick $1 -resize 120x120 -gravity center "static/images/thumbnails/$BASENAME"
cp $1 "static/images/full-res/$BASENAME"
