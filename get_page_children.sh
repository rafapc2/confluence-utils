#!/bin/sh

atlassianUrl=$1
user=$2
token=$3
pageParentId=$4




#listar hijos de pagina  
#GET /wiki/rest/api/content/search?cql=parent=<parentId>
curl --user $user:$token $atlassianUrl/wiki/rest/api/content/search?cql=parent=$pageParentId | jq  '.'
