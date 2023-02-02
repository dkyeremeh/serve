#!/bin/sh
version=14.2.0

docker buildx build . \
--platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
--tag eldekyfin/serve:$version \
--tag eldekyfin/serve:latest  \
--push