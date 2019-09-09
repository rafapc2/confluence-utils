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

function fnHtmlContent(){

 rowDom="DOM"
 rowService="SERVICE"
 rowDes="DESC"
 rowStatus="STATUS"
 rowUri="URI"
 rowAtc02="ATC02"
 rowATC07="ATC07"
 rowTesting="TESTING"
 rowConsumer="CONSUMER"
 rowBackend="BACKEND"
 htmlRow=$(<template/row.min.html)
 htmlTable=""
 count=1
while IFS=';' read -r rowDom rowService rowDes rowStatus rowUri rowAtc02 rowATC07 rowTesting rowConsumer rowBackend
do
    htmlRowTemp=$htmlRow
   # echo "I got: $rowDom $rowService $rowDes $rowStatus $rowUri $rowAtc02 $rowATC07 $rowTesting $rowConsumer $rowBackend"
    
    htmlRowTemp=${htmlRowTemp/__NUM__/$count}
    htmlRowTemp=${htmlRowTemp/__DOM__/$rowDom}
    htmlRowTemp=${htmlRowTemp/__SERVICE__/$rowService}
    htmlRowTemp=${htmlRowTemp/__DESC__/$rowDes}
    htmlRowTemp=${htmlRowTemp/__STATUS__/$rowStatus}
    htmlRowTemp=${htmlRowTemp/__URI__/$rowUri}
    htmlRowTemp=${htmlRowTemp/__ATC02__/$rowAtc02}
    htmlRowTemp=${htmlRowTemp/__ATC07__/$rowATC07}
    htmlRowTemp=${htmlRowTemp/__TESTING__/$rowTesting}
    htmlRowTemp=${htmlRowTemp/__CONSUMER__/$rowConsumer}
    
    htmlRowTemp=${htmlRowTemp/__BACKEND__/$rowBackend}
    #echo $htmlRowTemp

    count=$(( $count +1 ))
    htmlTable=$htmlTable$htmlRowTemp

    #echo $htmlTable
done < data/analisis.csv
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

spaceKey="~899589794"
pageParentId="732694529"

#creacion dinamica de filas
fnHtmlContent
rm -f template/table.min.tmp.html
touch template/table.min.tmp.html
head=$(<template/head.min.html)
tail=$(<template/tail.min.html)

echo "${head}${htmlTable}${tail}" >> template/table.min.tmp.html

#se prepara html para incrustar en el json
PageContentHTML=$(jq -Rs '.' template/table.min.tmp.html)



#echo "${PageContentHTML}" >> tmp.json
echo "------------------------"
echo "------------------------"
echo "------------------------"

pageTitle='OSB_RAFA'
./create_child_page.sh $atlassianUrl $user $token $spaceKey "$pageTitle" $pageParentId "${PageContentHTML}"

#entityId="729744013"