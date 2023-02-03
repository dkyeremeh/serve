#!/bin/bash
dir=$(dirname $0)

source $dir/functions.sh

their_version=$(get_latest_release vercel/serve)
our_version=$(get_tag)

if [ "$their_version" \> "$our_version" ]; then
    git tag $their_version
    git push
    build_images eldekyfin/serve $their_version
else
    echo "Already up to date. No need to rebuild"
fi
