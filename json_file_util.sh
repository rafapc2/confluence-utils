#!/bin/sh
set -e


echo "key del primer nivel"
cat tmp_file.json | jq '. | keys '

echo "valores primer nivel"


cat tmp_file.json | jq ' .id '

#eval "$(jq -r '. | to_entries | .[] | .key + "=\"" + .value + "\""' < tmp_file.json)"