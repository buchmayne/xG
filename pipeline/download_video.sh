#!/bin/bash

GAME_DATE="09-21-2025"
GAME_VIDEO_START_TIME="0530PM"
OUTPUT_DEST="game_videos/${GAME_DATE}/${GAME_DATE}_${GAME_VIDEO_START_TIME}_raw.mp4"
AMLST_FILE="/redirect/a9e135ab2af84f80a37e67dfdb4c4454-vod/amlst:8ANeeXoBVcMRfFsjCeaQ5zwQt6CDmeOshJUi4ijhi2oTHwTERlvQ4_2BhJ6_2B_2FWb70Y3ocbrmhYfTl_2B9ekxLV71SQYh8UkMeCi70AhWH74euhTN5ySYak6YmqrrAFLHp7Gye1yQ3INooPPFLmmBsc3KR07hYTSOJs0n"

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