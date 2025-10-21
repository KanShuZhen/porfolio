#!/bin/bash

OLD_DOMAIN="shuzhen-portfolio.local"
OUTPUT_DIR=""

echo "🔄 Starting comprehensive crawl of $OLD_Domain..."

# Remove existing directory
rm -rf $OUTPUT_DIR

wget --mirror \
     --convert-links \
     --adjust-extension \
     --page-requisites \
     --no-parent \
     --html-extension \
     --no-host-directories \
     --domains $OLD_DOMAIN \
     --wait=1 \
     --random-wait \
     --level=inf \
     --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" \
     --reject-regex=".*wp-(admin|login|register).*|.*feed.*|.*comment.*|.*trackback.*|.*xmlrpc.*|.*\?p=.*" \
     --span-hosts \
     --no-check-certificate \
     --retry-connrefused \
     --timeout=30 \
     --tries=3 \
     --directory-prefix=$OUTPUT_DIR \
     http://$OLD_DOMAIN

echo "✅ Initial crawl complete!"
