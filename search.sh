#! /bin/bash


hottest() {
    url="https://api.github.com/search/repositories"
    query_params="o=desc&q=language:$1&sort=updated&per_page=1"
    return "$(curl -s "$url?$query_params" | jq -r '.items | .[] | .name')"
}

hottest JavaScript

# old_hotness=""

# while true; do
#     new_hotness=
#     if [[ $old_hotness != $new_hotness ]]; then
#         message="Alert! The hottest JavaScript project is $new_hotness"
#         echo "$message"
#         say "$message"
#         old_hotness="$new_hotness"
#     fi
#     sleep 1
# done
