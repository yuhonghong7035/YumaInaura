#!/usr/bin/env bash

set -eu

basedir=$(dirname "$0")

source "${basedir}/../../setting.sh"
source "${basedir}/prepare.sh"

message=$(cat /dev/stdin)

if [ -z "$message" ]; then
  echo Nothing to do
fi

cat "$github_issue_list_log_file" | \
  jq "map(select(.title == \"$TITLE\"))" \
  | tee "$github_found_issue_log_file"

cat "$github_found_issue_log_file" | \
  jq 'select(length > 0) | .[0]' | \
  tee "$github_found_top_issue_log_file"

github_found_top_issue=$(cat "$github_found_top_issue_log_file")

if [[ ! -z "$github_found_top_issue" ]]; then
  body=$(echo "$github_found_top_issue" | jq --raw-output '.body')"$message"
  issue_number=$(echo "$github_found_top_issue" | jq '.["number"]')

  github_issue=$(
    OWNER=YumaInaura \
    API_KEY="$github_api_key" \
    REPOSITORY="$github_repository" \
    BODY="$body" \
    NUMBER="$issue_number" \
    python "$api_dir"/github/create-or-edit-issue.py
  )
else
  body=$message

  github_issue=$(
    OWNER=YumaInaura \
    API_KEY="$github_api_key" \
    REPOSITORY="$github_repository" \
    TITLE="$TITLE" \
    BODY="$body" \
    python "$api_dir"/github/create-or-edit-issue.py
  )
fi

echo "$github_issue"