#! /bin/bash


hottest() {
    url="https://api.github.com/search/repositories"
    query_params="o=desc&q=language:$1&sort=updated&per_page=1"
    result="$(curl -s "$url?$query_params" | jq -r '.items | .[] | .name')"
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
