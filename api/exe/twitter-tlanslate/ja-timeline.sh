#!/usr/bin/env bash

set -eu

basedir=$(dirname "$0")
source "${basedir}/../../setting.sh"

mkdir -p "$log_dir"

cp ~/.secret/twitter-yumainaura-config.py "$api_dir"/twitter/config.py
ALL=1 ROUND=1 "$api_dir"/twitter/timeline.py > "$log_dir"/ja-timeline.json

start_unixtimestamp=$(($(date +%s)-60))
cat "$log_dir"/ja-timeline.json | "$api_dir"/filter-timestmap.py "$start_unixtimestmap"

