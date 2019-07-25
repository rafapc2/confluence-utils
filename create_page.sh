#!/bin/sh

#crear una pagina
atlassianUrl=$1
user=$2
token=$3
spaceKey=$4
pageTitle=$5
pageContent=$6

payload='{"type":"page","title":"'${pageTitle}'","space": {"key":"'$spaceKey'"},"body": {"storage": {"value": "'${pageContent}'","representation": "storage"}}}'

echo "'$payload'"

curl --user $user:$token  -X POST -H 'Content-Type: application/json' -d "${payload}" $atlassianUrl/wiki/rest/api/content/ | jq '.'