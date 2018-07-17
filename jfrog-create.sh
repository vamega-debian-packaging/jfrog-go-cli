#!/bin/bash

source jfrog-vars.sh

jfrog bt package-create \
      --licenses "Apache-2.0" \
      --vcs-url 'https://github.com/vamega-debian-packaging/jfrog-go-cli' \
      --website-url "${WEBSITE_URL}" \
      --desc "${DESCRIPTION}" \
      "${REPO}"
