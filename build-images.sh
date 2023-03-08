#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2023.03/Dockerfile -t cimg/deploy:2023.03.1 -t cimg/deploy:2023.03 .
docker build --file 2023.03/node/Dockerfile -t cimg/deploy:2023.03.1-node -t cimg/deploy:2023.03-node .
