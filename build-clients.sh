#!/bin/bash

LOCDIR=$PWD
FOLDER=$(basename $LOCDIR)
PARENTDIR=$(dirname $PWD)
targets=( "android" ) # "php" ) # "java" "akka-scala" "python" "javascript" "go" "csharp" "typescript-angular")
VERSION=$(grep 'version:' src/api/api.yaml | awk -F'"' '$0=$2')

SYNC_GIT=1

LGR='\033[0;37m'
BLUE='\033[0;34m'
CYAN='\033[0;35m'
NC='\033[0m'
bold=$(tput bold)
rev=$(tput rev)
normal=$(tput sgr0)

echo -e $LGR
cat ${PWD}/.header
echo "                                       ${rev} C1tyPAy ${VERSION} ${normal}"
echo -e ${NC}


codegen() {
    # --entrypoint /bin/ash -it
    docker container run --rm -v ${PARENTDIR}:/local swaggerapi/swagger-codegen-cli generate \
     --input-spec /local/${FOLDER}/src/api/${1} \
     --config /local/${FOLDER}/src/config/${2} \
     --output /local/citypay-pos-${lang}-client \
     --lang ${lang}
}

pop_version() {
    cd ${LOCDIR}
    # update the json configuration file with the current versioning, required for some packages
    jq '.artifactVersion = "${VERSION}"' src/config/api-${1}-config.json > src/config/api-config.json
    jq '.packageVersion = "${VERSION}"'  src/config/api-${1}-config.json > src/config/api-config.json
}

sync_git() {
    # if the directory does not exist, clone from github
        if [ SYNC_GIT = 1 ]; then
            if [ ! -d "$2" ];
            then
                git clone -v ${1} ${2} || echo "No remote repository found at ${1}"
            else
                # pull the latest from github
                cd $2
                echo -e "${CYAN}git fetch origin${BLUE}"
                git fetch origin
                echo -e "${CYAN}git pull origin${BLUE}"
                git pull origin

            fi
        fi
}


for lang in "${targets[@]}"
do

    echo -n "> Build ${bold}${lang}${normal} client? [y|N|q] "
    read -r response

    if [[ "$response" =~ ^([qQ][uU][iI]|[tT])+$  ]]
    then
        exit 0
    fi

    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then

        pop_version $lang

        APP=citypay-pos-${lang}-client
        TARGETDIR=${PARENTDIR}/${APP}
        GITHUB=https://github.com/citypay/${APP}

        echo -e "\n\n=============================================================================="
        echo -e "Init ${lang} client, repo: ${GITHUB}\n${BLUE}"

        sync_git $GITHUB $TARGETDIR

        echo -e "${NC}Generating ${lang} client in ${TARGETDIR}${LGR}"
        cd ${LOCDIR}

        if [ $lang = "android" ];
        then

            echo " Kinetic... "
            # create kinetic directory for docs, move any existing into a temp location
            mkdir -p ${TARGETDIR}/docs/kinetic
            mkdir -p ${TARGETDIR}/docs/temp

            cd ${TARGETDIR}/docs
            mv *.md temp/
            codegen "kinetic.yaml" "kinetic-${lang}-config.json"

            # move constructed docs to kinetic folder
            cd ${TARGETDIR}/docs
            mv *.md kinetic/
            mv temp/*.md ./
            rmdir temp
            cd LOCDIR

            echo " ... >> "
        fi

        codegen "api.yaml" "api-config.json"

        cd ${TARGETDIR}
        git add --all .

        # clean up
        cd ${LOCDIR}
        rm src/config/api-config.json

        echo -e "${NC}Creating ${lang} client complete"

    fi


done

