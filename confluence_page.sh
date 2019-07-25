#!/bin/bash
TEXT='<p>New page</p>'
echo '{"type":"page","title":"New page","ancestors":[{"id":"'${PAGE_ID}'"}],"space":{"key":"TR"},"body":{"storage":{"value":"'$TEXT'","representation":"storage"}}}' > update.json
curl -u ${CONFLUENCE_PAGE_CREDS} -X POST -H 'Content-Type: application/json' -d '@update.json' https://YOURDOMAIN.atlassian.net/wiki/rest/api/content/ | python -mjson.tool
#rm update.json



