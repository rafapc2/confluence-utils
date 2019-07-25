#!/bin/bash

#crear una pagina
atlassianUrl=$1
user=$2
token=$3
spaceKey=$4
pageTitle=$5
pageParentId=$6
pageContent=$7

payload='{"type":"page","title":"'${pageTitle}'","ancestors":[{"id":"'$pageParentId'"}],"space":{"key":"'$spaceKey'"},"body": {"storage":{"value":"'${pageContent}'","representation":"storage"}}}'


curl --user $user:$token  -X POST -H 'Content-Type: application/json' -d "${payload}" $atlassianUrl/wiki/rest/api/content/ | jq '.'