#!/usr/bin/env bash

set -eu

basedir=$(dirname "$0")
source "${basedir}/../../setting.sh"

mkdir -p "$log_dir"

USER_ID="473780756"
cat "$log_dir"/ja-timeline.json | OWN_USER_ID="$USER_ID" "$api_dir"/twitter/filter-own.py > "$log_dir"/ja-timeline-own.json

start_unixtimestamp=$(($(date +%s)-$interval_second))
cat "$log_dir"/ja-timeline-own.json | "$api_dir"/twitter/filter-timestamp.py "$start_unixtimestamp" | tee "$log_dir"/ja-timeline-recent.json

cat "$log_dir"/ja-timeline-recent.json | jq '.[].full_text' | perl -pe 's/^"|"$//g' | tee "$log_dir"/ja-text.log

