#! /bin/bash

curl -s "https://api.github.com/search/repositories?o=desc&q=language:JavaScript&sort=updated" | jq -r '.items | .[] | .name'
