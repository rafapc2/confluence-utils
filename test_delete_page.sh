#!/bin/sh
set -e

function pause(){
   read -p "$*"

#read -n1 -r -p "Press space to continue..." key
#  if [ "$key" = '' ]; then
    # Space pressed, do something
#     echo [$key] is empty when SPACE is pressed # uncomment to trace
#  else
    # Anything else pressed, do whatever else.
     echo [$key] not empty
#  fi

}





#parametros
#atlassianUrl="https://SUBDOMAIN.atlassian.net"
#user="USER@MAIL.COM"
#token="CONFLUENCE_token"

#read vars from properties file
while IFS== read -r var value
do
    export "$var"="$value"
    echo "var=$var : value=$value"
    export "$var"="$value"
done < config/config.properties
pageArray=(7351515157, 35216570 735412912 735412903 735151506 735412894  735151497 735412885)                  

                       
for i in "${pageArray[@]}"
do
    echo $i
   ./delete_page.sh  $atlassianUrl $user $token $i
done
