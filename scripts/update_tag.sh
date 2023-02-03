#!/bin/bash
dir=$(dirname $0)

source $dir/functions.sh

their_version=$(get_latest_release vercel/serve)
our_version=$(get_tag)

if [ "$their_version" \> "$our_version" ]; then
    git tag $their_version
    git push origin $their_version
    build_n_push eldekyfin/serve $their_version
else  
    echo Image is recent. Nothing to do...
fi