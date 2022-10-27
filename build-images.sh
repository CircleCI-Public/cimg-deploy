#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.10/Dockerfile -t cimg/deploy:2022.10.1 -t cimg/deploy:2022.10 .
docker build --file 2022.10/node/Dockerfile -t cimg/deploy:2022.10.1-node -t cimg/deploy:2022.10-node .
