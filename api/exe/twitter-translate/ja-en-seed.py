#!/usr/bin/env python3

import sys, json, re, os

tweets = json.loads(sys.stdin.read())

results = []

for tweet in tweets:
  use_this_tweet = False

  if tweet['is_quote_status']:
    use_this_tweet = True

  #if not tweet['in_reply_to_status_id']:
  #  use_this_tweet = True

  if not use_this_tweet:
    continue

  seed = {}
 
  seed['text'] = re.sub(r'https://t.co/\w+$', '' , tweet['en_translated_text'])
  seed['text'] = seed['text'][:280]

  seed['attachment_url'] = tweet['url']
  seed['in_reply_to_status_id'] = tweet['id_str']

  results.append(seed)

print(json.dumps(results))

