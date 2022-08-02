#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.08/Dockerfile -t cimg/deploy:2022.08.1 -t cimg/deploy:2022.08 .
docker build --file 2022.08/node/Dockerfile -t cimg/deploy:2022.08.1-node -t cimg/deploy:2022.08-node .
