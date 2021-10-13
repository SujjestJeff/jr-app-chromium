#!/bin/sh
cd /app
HOME="/app"
exec /usr/bin/chromium-browser --no-sandbox --disable-gpu --user-data-dir --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --disable-dev-shm-usage