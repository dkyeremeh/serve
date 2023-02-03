#!/bin/bash

function get_latest_release {
  wget -q https://api.github.com/repos/$1/releases/latest -O - | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

function get_tag {
  git tag | tail -n 1
}

function build_n_push {

  echo Docker is building
  exit 0;

  docker buildx build . \
  --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
  --tag $1:$2 \
  --tag $1:latest  \
  --push
}