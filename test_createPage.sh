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

#instalar
#instalar python
#pip install mjson

#listar mi espacio
#------------------
#token:xxxxxxxxxxxxx

# 899589794 (ESPACE KEY)
#  727680102 (OVERVIEW)
#     727484054 (PAGINA Actividades Equipo)
#     729678897 (PAGINA Test Catalogo Servicio)
#        729646684 (PAGINA Test01)
#
#
#


#parametros
atlassianUrl="https://SUBDOMAIN.atlassian.net"
user="USER@MAIL.COM"
token="CONFLUENCE_token"

spaceKey="~899589794"
pageParentId="729678897"

templateId="729744013"

#PageContentHTML=$(<body.min.html)
PageContentHTML=$(jq -Rs '{"value": . ,"representation":"storage"}' body.html)



#echo "$PageContentHTML"
echo "------------------------"
echo "------------------------"
echo "------------------------"

pageTitle='test title'
./create_child_page.sh $atlassianUrl $user $token $spaceKey "$pageTitle" $pageParentId "$PageContentHTML"

entityId="729744013"