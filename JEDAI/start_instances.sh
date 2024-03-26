#!/bin/bash
export NOVNC_PORT=8080 JEDAI_PORT=8000
base_novnc=$NOVNC_PORT
base_jedai=$JEDAI_PORT
while getopts n: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
    esac
done 

for i in $(seq 1 1 $number)
do  
    novnc_port=$(($base_novnc + $i))
    jedai_port=$(($base_jedai + $i))
    NOVNC_PORT=$novnc_port JEDAI_PORT=$jedai_port && docker compose -p instance$i up -d
done