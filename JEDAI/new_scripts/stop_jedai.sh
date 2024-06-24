#!/bin/bash

cd /usr/share/jedai

RED='\033[0;31m'
GREEN='\033[0;32m'
DEF_COLOR='\033[0m'

default_string='_default'

# Update the repo always unless "nosave" is provided as an option.
if [[ "$1" != "nosave" ]]; then

    echo -e "${GREEN}Saving JEDAI.Ed container updates${DEF_COLOR}"
    ./update_image.sh
else
    echo -e "${RED}**NOT** saving JEDAI.Ed container updates${DEF_COLOR}"
fi

docker compose -p $USER stop
docker network rm $USER$default_string

docker container prune -f
