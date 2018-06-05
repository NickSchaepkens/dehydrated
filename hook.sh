#!/usr/bin/env bash

#
# dns-01 challenge for DuckDNS
# https://www.duckdns.org/spec.jsp

set -e
set -u
set -o pipefail

DOMAIN="hass-jos.duckdns.org"
TOKEN="746e18cc-014d-4b44-84db-1849472c00ea"

case "$1" in
    "deploy_challenge")
        curl "https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&txt=$4"
        echo
        ;;
    "clean_challenge")
        curl "https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&txt=removed&clear=true"
        echo
        ;;
    "deploy_cert")
        ;;
    "unchanged_cert")
        ;;
    "startup_hook")
        ;;
    "exit_hook")
        ;;
    *)
        echo Unknown hook "${1}"
        exit 0
        ;;
esac
