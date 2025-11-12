#!/bin/bash

GAME_DATE="11-06-2025"

GAME_VIDEO_START_TIME="0830PM"
OUTPUT_DEST="game_videos/${GAME_DATE}/${GAME_DATE}_${GAME_VIDEO_START_TIME}_raw.mp4"
AMLST_FILE="	/redirect/a9e135ab2af84f80a37e67dfdb4c4454-vod/amlst:b19zavDVGghYW_2BvfTFkWbeYqQvhXNsgPS8Y1Rh6hqfWx4wOJ_2BeQns6Np4cGcVvZpW1qsyJzcrDxN8x0e9aPuS55fVRcSdTyRCf6ztLCI7c2t60kPGfIqdXpptSjwAYqzAHD0xz8EIRkt5T5gn7lKen6vzVd6qtYw"

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