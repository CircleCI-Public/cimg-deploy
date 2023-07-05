#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2023.07/Dockerfile -t cimg/deploy:2023.07 -t cimg/deploy:2023.07 .
docker build --file 2023.07/node/Dockerfile -t cimg/deploy:2023.07-node -t cimg/deploy:2023.07-node .
