#!/bin/bash
dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
rm filelist.txt
touch filelist.txt
yourfilenames=`ls GX*`
for eachfile in $yourfilenames
do
   echo $eachfile
   printf "file '%s'\n" $eachfile >> filelist.txt
done

ffmpeg -y -f concat -i filelist.txt -c copy -map 0:0 -map 0:1 -map 0:3 cat.mp4
ffmpeg -i cat.mp4 -c:v h264_videotoolbox -q:v 40 compressed.mp4

rm cat.mp4