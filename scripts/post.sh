#!/usr/bin/env bash

echo "title: "
read title

echo "upload_file: "
read upload_file

user_id=`curl -s -H "Authorization: Bearer ${MEDIUM_TOKEN}" https://api.medium.com/v1/me | jq .data.id`
content=`less ${upload_file}`
data="{\"title\":\"${title}\",\"contentFormat\",\"markdown\",\"publishStatus\":\"draft\",\"content\":\"${content}\"}"
query="curl -H \"Authorization: Bearer ${MEDIUM_TOKEN}\" -H \"Content-Type: application/json\" -d ${data}"
eval ${query}

