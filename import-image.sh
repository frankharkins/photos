# /usr/bin/sh

BASENAME=$(basename $1)
magick $1 -blur 0x3 -quality 5 "static/images/thumbnails/$BASENAME"
cp $1 "static/images/full-res/$BASENAME"
