#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2023.05/Dockerfile -t cimg/deploy:2023.05.1 -t cimg/deploy:2023.05 .
docker build --file 2023.05/node/Dockerfile -t cimg/deploy:2023.05.1-node -t cimg/deploy:2023.05-node .
