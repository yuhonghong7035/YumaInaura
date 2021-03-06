#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os, sys, requests, json, fileinput, re

token = os.environ.get('TOKEN')
translate_json_key = os.environ.get('TRANSLATE_JSON_KEY') if os.environ.get('TRANSLATE_JSON_KEY') else 'text'

seeds = json.loads(sys.stdin.read())

results = []

for seed in seeds:
  translated = seed

  resource_message = seed[translate_json_key]
  translate_format = os.environ.get('FORMAT') if os.environ.get('FORMAT') else 'text'
  from_language = os.environ.get('FROM') if os.environ.get('FROM') else seed['from']
  to_language = os.environ.get('TO') if os.environ.get('TO') else seed['to']

  params = {
    'q': resource_message,
    'source': from_language,
    'target': to_language,
    'format': translate_format
  }
 
  api_url = 'https://translation.googleapis.com/language/translate/v2'
 
  headers = {
   'Authorization': 'Bearer {}'.format(token),
   'Content-Type': 'application/json',
  }
 
  res = requests.post(api_url, headers=headers, json=params)

  translated_json_key = os.environ.get('TRANSLATED_JSON_KEY') if os.environ.get('TRANSLATED_JSON_KEY') else to_language + '_translated_text'
  translated[translated_json_key] = res.json()['data']['translations'][0]['translatedText']

  results.append(translated)
 
print(json.dumps(results))

