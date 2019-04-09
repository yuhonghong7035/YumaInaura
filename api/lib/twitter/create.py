#!/usr/bin/env python3

#https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/post-statuses-update.html

import json, config, os, re, sys
import time, twitterauth
import datetime
from datetime import timedelta

twitter = twitterauth.twitter()

config.ACCESS_TOKEN_SECRET

message = sys.stdin.read()

twitter = OAuth1Session(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

params = {
  "status" : message
}

api_url = 'https://api.twitter.com/1.1/statuses/update.json'

res = twitter.post(api_url, params=params)

print(json.dumps(res.json()))

