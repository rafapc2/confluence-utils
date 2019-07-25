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
#token:vbvbvbvbvbv

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

examplePageId="729646684"

#./get_space_info.sh $atlassianUrl $user $token $spaceKey

#pause "presiona una tecla para listar hijos de pagina '$pageParentId'"

#./get_page_children.sh  $atlassianUrl $user $token $pageParentId



#pause "presiona una tecla para obtener el listado de template"
#./get_template_list.sh $atlassianUrl $user $token $spaceKey

#pause "presiona una tecla para listar template '$templateId'"

#./get_template.sh  $atlassianUrl $user $token $templateId


pause "presiona una tecla para detallar pagina '$examplePageId'"

./get_page_detail.sh  $atlassianUrl $user $token $examplePageId
#listar contenido de pagina  
#GET /wiki/rest/api/content/{id}/descendant

#pause "presiona una tecla para crear una pagina en la raiz  de tu confluence"
#crear pagina

pageTitle='Titulo de la Pagina'
pageContent='<p>Esta es una nueva pagina creada via API</p>'

#./create_page.sh $atlassianUrl $user $token $spaceKey "$pageTitle" "$pageContent"


pause "presiona una tecla para crear una pagina bajo la pagina con id '$pageParentId'"
pageTitle='Titulo de la Pagina hija'
pageContent='<p>Esta es una nueva pagina creada via API</p>'
#./create_child_page.sh $atlassianUrl $user $token $spaceKey "$pageTitle" $pageParentId "$pageContent"

PageContentHTML=$(<body.html)
#echo "$value"
pageTitle='Titulo de la Pagina hija 2'
#./create_child_page.sh $atlassianUrl $user $token $spaceKey "$pageTitle" $pageParentId "$PageContentHTML"

entityId="729744013"

#jq --arg text "$(<body.min.html)" '.content.text=$text' file.json >newfile.json
#jq --slurpfile texts <(jq -Rs body.html) '.content.text=$texts[0]' file.json >newfile.json

#jq -Rs '{ html: . }' body.html