#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2023.06/Dockerfile -t cimg/deploy:2023.06.1 -t cimg/deploy:2023.06 .
docker build --file 2023.06/node/Dockerfile -t cimg/deploy:2023.06.1-node -t cimg/deploy:2023.06-node .
