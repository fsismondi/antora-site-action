#!/bin/sh

set -eu 
set -o pipefail 

echo "Using args: 
 src: $INPUT_SITE_SOURCES_PATH 
 site generator: $INPUT_ANTORA_GENERATOR 
 search bar enabled: $INPUT_ANTORA_SEARCH_BAR
 "

cd $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH

ls -ltr $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH

NODE_PATH="$(npm -g root)" \
DOCSEARCH_INDEX_VERSION=latest \
DOCSEARCH_ENABLED=$INPUT_ANTORA_SEARCH_BAR \
antora \
--generator $INPUT_ANTORA_GENERATOR \
--stacktrace $INPUT_ANTORA_PLAYBOOK 
