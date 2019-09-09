#!/bin/sh

function timestamp(){
    date +%s
}

#crear una pagina
atlassianUrl=$1
user=$2
token=$3
spaceKey=$4
pageTitle=$5
pageContent=$6

payload='{"type":"page","title":"'${pageTitle}'","space": {"key":"'$spaceKey'"},"body": {"storage": {"value": "'${pageContent}'","representation": "storage"}}}'

curl --user $user:$token  -X POST -H 'Content-Type: application/json' -d "${payload}" $atlassianUrl/wiki/rest/api/content/ | jq '.' > tmp_file.json

idNewPage=$(cat tmp_file.json | jq -r ' .id ')
#retornamos el valor del id para, para el siguiente paso
echo ${idNewPage}