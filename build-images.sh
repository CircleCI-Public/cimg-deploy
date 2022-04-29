#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.04/Dockerfile -t cimg/deploy:2022.04.2  -t cimg/deploy:2022.04 .
docker build --file 2022.04/node/Dockerfile -t cimg/deploy:2022.04.2-node  -t cimg/deploy:2022.04-node .
