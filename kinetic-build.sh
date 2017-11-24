#!/bin/bash

echo " ^^^^^^^^^^^^^^^ ${1}"
echo " Kinetic's train is a coming... "
echo ""

APPDIR=$PWD

# create kinetic directory for docs, move any existing into a temp location
mkdir -p clients/citypay-pos-${1}-client/docs/kinetic
mkdir -p clients/citypay-pos-${1}-client/docs/temp

cd clients/citypay-pos-${1}-client/docs
mv *.md temp/

cd $APPDIR

docker container run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate \
     --input-spec /local/src/api/kinetic.yaml \
     --config /local/src/config/kinetic-${1}-config.json \
     --output /local/clients/citypay-pos-${1}-client \
     --lang ${1}

# move constructed docs to kinetic folder
cd clients/citypay-pos-${1}-client/docs
mv *.md kinetic/
mv temp/*.md ./
rmdir temp
cd $APPDIR

echo " ... ah yeah"