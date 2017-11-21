#!/bin/bash

# extract the api version from the documentation, not fail safe but works in a basic config
VERSION=$(grep 'version:' src/api/api.yaml | awk -F'"' '$0=$2')

docker container run -v $(pwd):/gen --rm --env SWAGGER_FILE=src/api/api.yaml -it citypay/swagger-docs:1.0.0

