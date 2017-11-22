#!/bin/bash

api=src/api/api.yaml
APPDIR=${PWD}
targets=( "android" "php" "java" "akka-scala" "python" "javascript" "go" "csharp" "typescript-angular")
VERSION=$(grep 'version:' src/api/api.yaml | awk -F'"' '$0=$2')

cat ${PWD}/.header
echo "                                       C1tyPAy ${VERSION}

"

for i in "${targets[@]}"
do

    cd ${APPDIR}

    # update the json configuration file with the current versioning, required for some packages
    jq '.artifactVersion = "${VERSION}"' src/config/api-${i}-config.json > src/config/api-config.json
    jq '.packageVersion = "${VERSION}"'  src/config/api-${i}-config.json > src/config/api-config.json

    APP=citypay-pos-${i}-client
    DIRECTORY=${PWD}/clients/${APP}
    GITHUB=https://github.com/citypay/${APP}

    echo ""
    echo ""
    echo "=============================================================================="
    echo "Creating ${i} client, repo: ${GITHUB}"
    echo "in ${PWD}"
    echo ""

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
#    docker container run --rm -v ${APPDIR}:/local swaggerapi/swagger-codegen-cli generate \
#     --input-spec /local/${api} \
#     --config /local/src/config/api-config.json \
#     --output /local/clients/citypay-pos-${i}-client \
#     --lang ${i}

    git add .

    # clean up
    rm src/config/api-config.json

    echo "Creating ${i} client complete"

    cd ${DIRECTORY}


done

