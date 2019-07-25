#!/bin/sh

 #listar contenido de espacio  
atlassianUrl=$1
user=$2
token=$3
spaceKey=$4

curl --user $user:$token -X GET -H "Content-Type: application/json" $atlassianUrl/wiki/rest/api/content?spaceKey=$spaceKey | jq '.'