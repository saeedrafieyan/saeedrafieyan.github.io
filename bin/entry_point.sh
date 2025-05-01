#!/bin/bash
set -e

CONFIG_FILE=_config.yml

# Ensure all gems (including Git-based ones like jekyll-terser) are installed
bundle install

# Start the Jekyll server in background
jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling &

# Monitor _config.yml for changes and restart Jekyll if it changes
while true; do
  inotifywait -q -e modify,move,create,delete $CONFIG_FILE
  if [ $? -eq 0 ]; then
    echo "Change detected to $CONFIG_FILE, restarting Jekyll"
    jekyll_pid=$(pgrep -f "jekyll serve")
    kill -KILL $jekyll_pid
    bundle install
    jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling &
  fi
done
