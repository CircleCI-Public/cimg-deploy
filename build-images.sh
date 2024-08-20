#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker context create cimg
docker buildx create --use cimg
docker buildx build --platform=linux/amd64,linux/arm64 --file 2024.08/Dockerfile -t cimg/deploy:2024.08.1 -t cimg/deploy:2024.08 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2024.08/node/Dockerfile -t cimg/deploy:2024.08.1-node -t cimg/deploy:2024.08-node --push .
