#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2023.01/Dockerfile -t cimg/deploy:2023.01 -t cimg/deploy:2023.01 .
docker build --file 2023.01/node/Dockerfile -t cimg/deploy:2023.01-node -t cimg/deploy:2023.01-node .
