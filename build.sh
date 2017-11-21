#!/bin/bash

# extract the api version from the documentation, not fail safe but works in a basic config
VERSION=$(grep 'version:' src/api.yaml | awk -F'"' '$0=$2')

docker container run -v $(pwd)/docs:/gen --rm --env SWAGGER_FILE=api.yaml -it citypay/swagger-docs:1.0.0

echo $VERSION
