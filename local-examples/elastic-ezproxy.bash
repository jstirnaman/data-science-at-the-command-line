# Download some elasticsearch results
curl -s 'http://{YOUR_ES_SERVER}/_search?q=@message:proxy+{DOMAIN, e.g. 'kumc}&scroll=1m' > es.json

# Get the id of the first hit
< es.json jq -c '.hits.hits[0]._id

# Get source fields from all hits.
< es.json jq -c '.hits.hits[]._source'

# Get source values from all hits
< es.json jq -c '.hits.hits[]._source[]'

# Get clientip values from all hits
< es.json jq -c '.hits.hits[]._source.clientip'

# Or
< es.json jq -c .hits.hits[]._source["clientip"]'

# Construct a new object from source, capturing clientip and message.
< es.json jq -c 'hits.hits[]._source | {clientip, message}'
