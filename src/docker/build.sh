#!/bin/sh

mkdir -p /gen/docs
spectacle -t /gen/docs -l logo.png /gen/${SWAGGER_FILE}
