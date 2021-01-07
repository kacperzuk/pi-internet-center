#!/bin/bash

set -exuo pipefail

function cf {
  method="$1"
  path="https://api.cloudflare.com/client/v4/$2"
  shift
  shift
  curl -sS \
       -H "Content-Type:application/json" \
       -H "X-Auth-Email: $CF_EMAIL" \
       -H "X-Auth-Key: $CF_API_KEY" \
       -X "$method" "$path" "$@"
}
 
ZONE_ID=$(cf GET "zones?name=$CF_DOMAIN" | jq -r '.result[0].id')
RECORD_ID=$(cf GET "zones/$ZONE_ID/dns_records?name=$CF_RECORD&type=A" | jq -r '.result[0].id')

IP=$(curl -sS https://ipinfo.io/ip)

cf PATCH "zones/$ZONE_ID/dns_records/$RECORD_ID" \
     -d "{\"content\":\"$IP\"}"

