#!/bin/sh

set -e
apk --update add git

mkdir -p /src

git -C /src clone https://github.com/Neilpang/acme.sh.git

cd /src/acme.sh
./acme.sh --install \
  --home /app/acme.sh \
  --certhome /etc/nginx/certs/ \
  --nocron

# Cleanup
cd /
rm -rf /src
apk del git
