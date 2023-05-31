#!/bin/bash
export NOVNC_PORT=8080 JEDAI_PORT=8000
while getopts n: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
    esac
done 
default_string='_default'

for i in $(seq 1 1 $number)
do  
    docker-compose -p instance$i stop
    docker network rm instance$i$default_string
done

docker container prune -f

