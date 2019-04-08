#!/usr/bin/env bash

set -eu

basedir=$(dirname "$0")
source "${basedir}/../../setting.sh"

cp ~/.secret/twitter-yumainaura2nd-config.py "$api_dir"/twitter/config.py

for en_text in "$(cat "$log_dir"/en-text-trancate.log)"; do
  echo "\"$en_text\"" | jq --raw-output | "$api_dir"/twitter/create.py
done
