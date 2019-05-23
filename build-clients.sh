#!/bin/bash

LOCDIR=$PWD
FOLDER=$(basename $LOCDIR)
PARENTDIR=$(dirname $PWD)
targets=( "java" "csharp" "typescript-angular" ) # "php" ) # "java" "akka-scala" "python" "javascript" "go" "csharp" "typescript-angular")
export VERSION=$(grep "version:" src/api/api.yaml | cut -d'"' -f 2)


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
echo "                                       ${rev} CityPay ${VERSION} ${normal}"
echo -e ${NC}

RELEASE_NOTE=''

echo -n "> Release note:"
read -r RELEASE_NOTE

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


pop_version() {
    cd ${LOCDIR}
    echo "POPVer"
    # update the json configuration file with the current versioning, required for some packages
    jq --arg VERSION "$VERSION" '.artifactVersion = $VERSION' src/config/api-${1}-config.json > src/config/api-config.json
    echo "POPVer.Net $VERSION"
    jq --arg VERSION "$VERSION" '.packageVersion = $VERSION'  src/config/api-${1}-config.json > src/config/api-config.json
}

for lang in "${targets[@]}"
do

    LANG_LOWER=$(echo "$lang" | awk '{print tolower($0)}')
    DEST="citypay-pos-${LANG_LOWER}-client"
    USER_AGENT="citypay-${LANG_LOWER}-client/${VERSION}"

    langopts() {
            # --entrypoint /bin/ash -it
        docker container run --rm \
         -v ${PARENTDIR}:/local swaggerapi/swagger-codegen-cli config-help \
         --lang ${lang}
    }

    codegen() {
        # --entrypoint /bin/ash -it
        docker container run --rm \
         -v ${PARENTDIR}:/local swaggerapi/swagger-codegen-cli generate \
         --input-spec /local/${FOLDER}/src/api/${1} \
         --config /local/${FOLDER}/src/config/${2} \
         --output /local/${DEST} \
         --release-note "${RELEASE_NOTE}" \
         --http-user-agent "${USER_AGENT}" \
         -t /local/${FOLDER}/src/templates/${lang} \
         --lang ${lang}
    }

    echo -n "> Build ${bold}${lang}${normal} client? [y|N|h|q] "
    read -r response

    if [[ "$response" =~ ^([qQ][uU][iI]|[tT])+$  ]]
    then
        exit 0
    fi

    if [[ "$response" =~ ^([hH])+$ ]]
    then
        docker container run --rm  swaggerapi/swagger-codegen-cli config-help --lang ${lang}
        exit 0
    fi

    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then

        TARGETDIR=${PARENTDIR}/${DEST}
        GITHUB=https://github.com/citypay/${DEST}

        echo -e "\n\n=============================================================================="
        echo -e "Init ${lang} client, repo: ${GITHUB}\n${BLUE}"

        sync_git $GITHUB $TARGETDIR

        echo -e "${NC}Generating ${lang} client in ${TARGETDIR}${LGR}"
        cd ${LOCDIR}


        pop_version $lang
        codegen "api.yaml" "api-config.json"

        cd ${LOCDIR}
        echo " Kinetic... "
        # create kinetic directory for docs, move any existing into a temp location
        mkdir -p ${TARGETDIR}/docs/kinetic
        mkdir -p ${TARGETDIR}/docs/temp

        cd ${TARGETDIR}/docs
        mv *.md temp/
        codegen "kinetic.yaml" "kinetic-${lang}-config.json"

        pwd
        ls -al


        # move constructed docs to kinetic folder
        cd ${TARGETDIR}/docs
        mv *.md kinetic/
        mv temp/*.md ./
        rmdir temp
        cd ${LOCDIR}

        echo " ... >> "

        # clean any files that want to be overwritten
        rm ${TARGETDIR}/pom.xml
        rm ${TARGETDIR}/README.md
        rm ${TARGETDIR}/build.gradle
        rm ${TARGETDIR}/*.sln

#        langopts

        cd ${TARGETDIR}
        git add --all .

        # clean up
        cd ${LOCDIR}
#        rm src/config/api-config.json

        echo -e "${NC}Creating ${lang} client complete"

    fi


done

