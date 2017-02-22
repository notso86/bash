#!/bin/bash

# Convert $SRC/*.ext and place them into $DEST/*.m4v
SRC=/srv/share/mkv
DEST=/srv/share/xcoded
DEST_EXT=m4v
HANDBRAKE_CLI=HandBrakeCLI
for FILE in `ls $SRC`; do
   filename=$(basename $FILE)
   extension=${filename##*.}
   filename=${filename%.*}
   nice -15 $HANDBRAKE_CLI -i $SRC/$FILE -o $DEST/$filename.$DEST_EXT -4 -e x264 -q 25.0 -a 1,1 -E faac,copy:ac3 -B 512,512 -6 dpl2,auto -R Auto,Auto -D 0.0,0.0 --audio-copy-mask aac,ac3,dtshd,dts,mp3 --audio-fallback ffac3 -f m4v --deinterlace --two-pass --turbo --loose-anamorphic --modulus 2 -m --x264-preset slow --h264-profile high --h264-level 4.1
done
