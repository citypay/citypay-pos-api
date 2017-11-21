#!/bin/bash

maven_cache_repo="${HOME}/.m2/repository"
api=src/api/api.yaml

# droid
docker container run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate \
    --input-spec /local/${api} \
    --config /local/src/config/api-android-config.json \
    --output /local/citypay-pos-android-client \
    --lang android

#docker container run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate \
#    --input-spec /local/${api} \
#    --config /local/src/config/api-php-config.json \
#    --output /local/citypay-pos-php-client \
#    --lang php