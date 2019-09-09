#!/bin/sh
set -e

function pause(){
   read -p "$*"
}
function timestamp(){
    date +%s
}

function appendResultFile(){
    echo ${1} >> data/page_creation_result.properties
}

#params


#read vars from properties file
    #atlassianUrl="https://SUBDOMAIN.atlassian.net"
    #user="USER@MAIL.COM"
    #token="CONFLUENCE_token"
while IFS== read -r var value
do
    export "$var"="$value"
    echo "var=$var : value=$value"
    export "$var"="$value"
done < config/config.properties

#read json config file
jsonConfigFile=$(cat config/base_tree.json)
echo "$jsonConfigFile"

#Pagina Raiz del catalogo de servicios
#eval "$(jq -r '.catalog | to_entries | .[] | .key + "=\"" + .value + "\""' < config/base_tree.json)" 

eval "$(echo ${jsonConfigFile} | jq -r '.catalog | to_entries | .[] | .key + "=\"" + .value + "\""' )"


pageTitle=$name
pageContent=$content


#valor asociado al ID de pagina la pagina nueva que se crea en este script
pageParentId="none" 
pageChildId="none" 

#parent page
pause "01.- Inicando creacion de pagina raiz: $name"
pageParentId=$(./create_page.sh $atlassianUrl $user $token $spaceKey "$pageTitle" "$pageContent")

echo "La pagina padre Creada tiene el siguiente ID: ${pageParentId}"
appendResultFile "${name}=${pageParentId}"

#children pages
pause "02.- presiona una tecla para continuar con la creacion de paginas de segundo Nivel (Paises)"

#eval "$(jq -r '.countryList | to_entries | .[] | .key + "=\"" + .value + "\""' < config/base_tree.json)"


for row in $(echo "${jsonConfigFile}" | jq  --compact-output '.countryList | .[] '); do

    echo ${row}
   
    _jq() {
     echo ${row} |  jq -r ${1}
    }

   
   currentPageTitle=$(_jq .countryName)
   currentPageContentHTML="Catalogo_${currentPageTitle}"
   pause "02.X  iniciando creacion de pagina ${currentPageTitle}" 
   countryPageId=$(./create_child_page.sh $atlassianUrl $user $token $spaceKey "$currentPageTitle" $pageParentId $currentPageContentHTML)
   echo "id pagina ${currentPageTitle} --> ${countryPageId}"
   appendResultFile "${currentPageTitle}=${countryPageId}"
done

#TODO contoniar com resolucion de obtencion del id que vienen con json
#crear paginas hijas de paises


