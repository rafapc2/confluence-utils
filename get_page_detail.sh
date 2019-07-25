#!/bin/sh

 #crear una pagina
atlassianUrl=$1
user=$2
token=$3
pageId=$4

curl --request GET \
  --url $atlassianUrl/wiki/rest/api/content/$pageId?expand=body.storage \
  --user $user:$token \
  --header 'Accept: application/json' | jq '.'