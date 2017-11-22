#!/bin/bash

# extract the api version from the documentation, not fail safe but works in a basic config
VERSION=$(grep 'version:' src/api/api.yaml | awk -F'"' '$0=$2')

docker container run -v $(pwd):/gen --rm --env SWAGGER_FILE=src/api/api.yaml -it citypay/swagger-docs:1.0.0

# will only work if the clients are generated, copies the md from the java client and includes for readme
if [ ! -d "clients/citypay-pos-java-client" ];
    then

    mkdir -p docs/md
    cp clients/citypay-pos-java-client/docs/*.md docs/md


fi
