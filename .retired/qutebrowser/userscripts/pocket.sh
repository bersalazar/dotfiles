#!/bin/bash

data=$(cat <<-EOF
{
  "actions":[
    {
      "action":"add",
      "url":"$QUTE_URL"}
  ],
  "locale_lang":"en-US"
}
EOF
)

this_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pocket_cookie=$(cat "${this_directory}/../.pocket-cookie")

curl "https://getpocket.com/v3/send?consumer_key=94110-6d5ff7a89d72c869766af0e0&enable_cors=1" \
  -H "authority: getpocket.com" \
  -H "x-accept: application/json; charset=UTF8" \
  -H "user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_16_0) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.15.2 Chrome/83.0.4103.122 Safari/537.36" \
  -H "content-type: application/json" \
  -H "accept: */*" \
  -H "dnt: 1" \
  -H "accept-language: en-US,en;q=0.9" \
  -H "origin: https://getpocket.com" \
  -H "sec-fetch-site: same-origin" \
  -H "sec-fetch-mode: cors" \
  -H "sec-fetch-dest: empty" \
  -H "referer: https://getpocket.com/my-list" \
  -H "cookie: $pocket_cookie" \
  --data-binary "$data" \
  --compressed

open https://getpocket.com/my-list
