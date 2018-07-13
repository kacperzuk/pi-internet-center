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
ask CF_EMAIL "Email of Cloudflare account: "
ask CF_API_KEY "Cloudflare API key (will be stored in .env file): "
