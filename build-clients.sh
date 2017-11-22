#!/bin/bash

api=src/api/api.yaml
APPDIR=${PWD}
targets=( "android" "php" "java" )
VERSION=$(grep 'version:' src/api/api.yaml | awk -F'"' '$0=$2')

cat ${PWD}/.header
echo "                                       C1tyPAy ${VERSION}

"

for i in "${targets[@]}"
do

    APP=citypay-pos-${i}-client
    DIRECTORY=${PWD}/clients/${APP}
    GITHUB=https://github.com/citypay/${APP}

    echo ""
    echo ""
    echo "=============================================================================="
    echo "Creating ${i} client, repo: ${GITHUB}"

    # if the directory does not exist, clone from github
    if [ ! -d "$APP" ];
    then
        git clone -v ${GITHUB} ${DIRECTORY} || echo "No remote repository found at ${GITHUB}"
    else
        # pull the latest from github
        cd ${DIRECTORY}
        git fetch origin
        git pull origin

    fi

    echo "Generating ${i} client in ${APPDIR}"
    cd ${APPDIR}
    # --entrypoint /bin/ash -it
    docker container run --rm -v ${APPDIR}:/local swaggerapi/swagger-codegen-cli generate \
     --input-spec /local/${api} \
     --config /local/src/config/api-${i}-config.json \
     --output /local/clients/citypay-pos-${i}-client \
     --lang ${i}

    cd ${DIRECTORY}



done

