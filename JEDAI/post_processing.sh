#!/bin/bash

export NOVNC_PORT=8200 JEDAI_PORT=8000
base_novnc=$NOVNC_PORT
base_jedai=$JEDAI_PORT

while getopts n:i: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
        i) id=${OPTARG};;
    esac
done 

docker exec instance$number-jedai-1 cp /root/git/JEDAI/out.txt /root/git/JEDAI/logs_dir/tmp_$id.txt
echo "$id logs saved"

default_string='_default'
docker compose -p instance$number stop
docker network rm instance$number$default_string

docker container prune -f

echo "instance $number stopped"

novnc_port=$(($base_novnc + $number))
jedai_port=$(($base_jedai + $number))
NOVNC_PORT=$novnc_port JEDAI_PORT=$jedai_port && docker compose -p instance$number up -d