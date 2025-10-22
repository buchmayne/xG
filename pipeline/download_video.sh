#!/bin/bash

GAME_DATE="10-20-2025"

GAME_VIDEO_START_TIME="0830PM"
OUTPUT_DEST="game_videos/${GAME_DATE}/${GAME_DATE}_${GAME_VIDEO_START_TIME}_raw.mp4"
AMLST_FILE="/redirect/a9e135ab2af84f80a37e67dfdb4c4454-vod/amlst:XZAI9eD_2FEE4eZA41D7bHhtoYLC6DG6lLPPoyc_2FsAAdul67Guf7xFdXIzqV1dvy3_2Fx09A_2BtAb5mDv6nsuEbdlBnEtcK3DFZ5nzCrttMxAAW9NaaofV6tR3Lu2b1DJqGenkgmqc_2BgwpSVilpR6_2BFQ0twFJLr9wTfsw"

URL_FILE="https://cdn.livebarn.com${AMLST_FILE}?type=m3u8"

# Create output directory if it doesn't exist
mkdir -p "game_videos/${GAME_DATE}"

# Download the video
yt-dlp \
  --cookies-from-browser firefox \
  --add-header "Referer:https://watchapi.livebarn.com/" \
  --retries 10 \
  --fragment-retries 10 \
  --socket-timeout 60 \
  -o "$OUTPUT_DEST" \
  "$URL_FILE"