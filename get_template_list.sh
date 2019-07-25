#!/bin/sh

 #crear una pagina
atlassianUrl=$1
user=$2
token=$3
spaceKey=$4

 curl --user $user:$token --request GET --url $atlassianUrl/wiki/rest/api/template/page?spaceKey=$spaceKey \
  --header 'Accept: application/json' | jq '.'
