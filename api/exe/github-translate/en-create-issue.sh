#!/usr/bin/env bash

set -eu

base_dir=$(dirname "$0")
source "${base_dir}/../../setting.sh"

cat "$log_dir"/en-translated.json \
  | \
    USER_NAME=YumaInaura \
    API_KEY=$(~/.secret/github-api_key ) \
      "$api_dir"/github/create-issue.py \
  | tee "$log_dir"/en-created-issue.json
