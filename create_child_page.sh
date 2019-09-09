#!/bin/bash

#crear una pagina
atlassianUrl=$1
user=$2
token=$3
spaceKey=$4
pageTitle=$5
pageParentId=$6
pageContent=$7

#eliminar solo si parte con comilla doble TODO
pageContent=${pageContent#?};
pageContent=${pageContent%?};

payload='{"type":"page","title":"'${pageTitle}'","ancestors":[{"id":"'$pageParentId'"}],"space":{"key":"'$spaceKey'"},"body": {"storage":{"value":"'${pageContent}'","representation":"storage"}}}'

echo "*********"
echo $payload
curl --user $user:$token  -X POST -H 'Content-Type: application/json' -d "${payload}" $atlassianUrl/wiki/rest/api/content/ | jq '.' 
#> tmp_child_file.json

#currentIdPage=$(cat tmp_child_file.json | jq -r '.id')
#retornamos el valor del id para, para el siguiente paso
#echo ${currentIdPage}

