#/bin/bash

source jfrog-vars.sh

set -x

curl -O -L -J "${DOWNLOAD_URL}"
fpm -s dir \
    -t deb \
    --description "${DESCRIPTION}" \
    --url "${WEBSITE_URL}" \
    -m "${MAINTAINER}" \
    -n "${PACKAGE_NAME}" \
    -v "${VERSION}" \
    --iteration 1 \
    'jfrog=/usr/bin/jfrog'
dpkg-deb --info jfrog*.deb
dpkg-deb -c jfrog*.deb

jfrog bt upload \
      --deb stretch/main/amd64 \
      --publish \
      jfrog-cli*.deb "${REPO}/${VERSION}"

