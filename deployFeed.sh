#!/usr/bin/env bash

if [ -f shared/automated-updates.sh ]; then
  source shared/automated-updates.sh
else
  echo "Check if submodule was loaded; automated-updates.sh is missing"
  exit 1
fi

templateFile="Dockerfile.template"
HELM_URL="https://api.github.com/repos/helm/helm/releases"
VERSION=$( date +%Y.%m )

function getHelm() {
  local url=$1
  local expression=$2
  version=$(curl -s "$url" | jq -r ".[] | select(.tag_name | test(\"$expression\")) | .tag_name" | head -1)

  generateVersions "$(cut -d "v" -f2 <<< "${version}")"
  generateSearchTerms "HELM_VER=" "$templateFile" '&\\ '
  replaceVersions "HELM_VER=" "$SEARCH_TERM" "true"
}

function deployFeed() {
  replaceDatedTags "$templateFile" ""
  getHelm "$HELM_URL" "^v[0-9]+(.[0-9]+)*$"
  ./shared/release "$VERSION"
}

deployFeed "$templateFile"
