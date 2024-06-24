#!/bin/bash

YELLOW='\033[0;33m'
DEF_COLOR='\033[0m'

# docker stop $(docker ps -a -q --filter ancestor=jedai:$USER --format="{{.ID}}")
./stop_jedai.sh nosave

docker rmi jedai:$USER

./create_image.sh

echo -e "${YELLOW}JEDAI.Ed image reset${DEF_COLOR}"
