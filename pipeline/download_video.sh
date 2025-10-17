#!/bin/bash

GAME_DATE="10-12-2025"
GAME_VIDEO_START_TIME="0830PM"
OUTPUT_DEST="game_videos/${GAME_DATE}/${GAME_DATE}_${GAME_VIDEO_START_TIME}_raw.mp4"
AMLST_FILE="/redirect/a9e135ab2af84f80a37e67dfdb4c4454-vod/amlst:ie1bWBvmqxHbyY1I6ovyYqVox3i33GuId7CKhqmGpUaG7gwPfAfQpKLP_2BoaTbDNX2h26ZwwyoovO_2Bv2oFUs6D_2Bav_2BC16TCfAzoKpL7kmP_2BPgDKJB6lEB9aNcASaGbmBufddc3wQHnY13mM4Xq6fMUgteboqseiZB"

URL_FILE="https://cdn.livebarn.com${AMLST_FILE}?type=m3u8"

# Create output directory if it doesn't exist
mkdir -p "game_videos/${GAME_DATE}"

# Download the video
yt-dlp \
  --cookies-from-browser firefox \
  --add-header "Referer:https://watchapi.livebarn.com/" \
  --retries 10 \
  --fragment-retries 10 \
  -o "$OUTPUT_DEST" \
  "$URL_FILE"