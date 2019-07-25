#!/bin/sh

 #crear una pagina
atlassianUrl=$1
user=$2
token=$3
templateId=$4

curl --request GET \
  --url $atlassianUrl/wiki/rest/api/template/$templateId \
  --user $user:$token \
  --header 'Accept: application/json' | jq '.'