#!/bin/sh

# 環境に合わせて調整
ffmpeg \
  -f v4l2 \
  -input_format mjpeg \
  -video_size 1280x720 \
  -framerate 30 \
  -i /dev/video0 \
  -vcodec libx264 \
  -acodec none \
  -g 120 \
  -preset ultrafast \
  -tune zerolatency \
  -f hls \
  -hls_time 4 \
  -hls_list_size 3 \
  -hls_flags delete_segments+split_by_time \
  /hls/list.m3u8 &

caddy run --config /etc/caddy/Caddyfile
