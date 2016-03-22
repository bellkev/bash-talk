#! /bin/bash

set -eu
set -o pipefail


hottest() {
    set -e
    result="$(curl -s "https://api.github.com/search/repositories?o=desc&q=language:$1&sort=updated&per_page=1" | jq -r '.items | .[] | .name')"
    echo "GH search result: $result" 1>&2
    echo "$result"
}

old_hotness=""

while true; do
    new_hotness="$(hottest JavaScript)"
    if [[ $old_hotness != $new_hotness ]]; then
        message="Alert! The hottest JavaScript project is $new_hotness"
        echo "$message"
        say "$message"
        old_hotness="$new_hotness"
    fi
    sleep 1
done
