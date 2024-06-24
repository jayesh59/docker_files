#!/bin/bash

function help() {

	echo "Usage: jedai [create|reset|start|save|stop (nosave)|restart|login]"
}

cd /usr/share/jedai

if [[ "$1" == "restart" ]]; then
    ./stop_jedai.sh $2
    ./start_jedai.sh
elif [[ "$1" == "stop" ]]; then
   ./stop_jedai.sh $2
elif [[ "$1" == "save" ]]; then
   ./update_image.sh
elif [[ "$1" == "create" ]]; then
   ./create_image.sh
elif [[ "$1" == "reset" ]]; then
   ./reset_image.sh
elif [[ "$1" == "start" ]]; then
    ./start_jedai.sh
elif [[ "$1" == "login" ]]; then
    ./start_jedai.sh
    docker exec -it $USER-jedai-1 /bin/bash
else
    help
    exit 1
fi

