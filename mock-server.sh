#!/bin/bash

# runs a swagger mock api in a docker container on port 8000
docker container run --rm -p 8000:8000 -v ${PWD}/src/api/api.yaml:/data/swagger.yaml -it palo/swagger-api-mock

