#!/usr/bin/env bash
set -e

: "${BITCARTGEN_DOCKER_IMAGE:=bitcartcc/docker-compose-generator}"
docker build generator --tag $BITCARTGEN_DOCKER_IMAGE

docker run -v "$PWD/compose:/app/compose" \
    --env-file <(env | grep BITCART_) \
    --rm $BITCARTGEN_DOCKER_IMAGE
