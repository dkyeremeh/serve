#!/bin/bash
dir=$(dirname $0)

source $dir/functions.sh

their_version=$(get_latest_release vercel/serve)
our_version=$(get_tag)

if [[ "$their_version" > "$our_version" ]]; then
    echo "Let us continue"
else
    echo "We are using the latest version"
    exit 2
fi