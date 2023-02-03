#!/bin/bash
dir=$(dirname $0)

source $dir/functions.sh


# their_version=$(get_latest_release vercel/serve)
their_version=14.1.0
our_version=13.1.1
# our_version=$(get_tag)

if [[ "$their_version" > "$our_version" ]]; then
    echo "Theirs: $their_version, Ours: $our_version"

    echo "$their_version" > $dir/../version.log
    git add .
    git commit -m "Updated to vercel/serve version $their_version"

    git tag $their_version
    git push origin $their_version
    
    echo "Update successful"
else
    echo "We are using the latest version. Nothing to do"
    # exit 2
fi