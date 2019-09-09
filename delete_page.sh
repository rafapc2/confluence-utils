#!/bin/bash

#crear una pagina
atlassianUrl=$1
user=$2
token=$3
pageId=$4

curl --request DELETE --user $user:$token $atlassianUrl/wiki/rest/api/content/$pageId | jq '.' 
