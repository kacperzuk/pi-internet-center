#!/bin/bash

function ask {
    key="$1"
    prompt="$2"
    echo -n "$prompt"
    read val
    echo "$key=$val" >> .env
}

echo -n > .env
ask DOMAIN "Domain name: "
ask LE_EMAIL "Email (for LetsEncrypt notifications): "
ask HTTPS_LISTEN_ADDR "HTTPS listen addr (0.0.0.0 for all interfaces): "
ask CF_API_TOKEN "Cloudflare API key (will be stored in .env file): "
ask CF_DOMAIN "Cloudflare domain (Zone) to update record in: "
ask CF_RECORD "CloudFlare record (subdomain) to update: "
echo PG_PASS=$(pwgen -s -c -n -B 50 1) >> .env
