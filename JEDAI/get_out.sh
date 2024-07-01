#!/bin/bash
while getopts i: flag
do
    case "${flag}" in
        i) instance=${OPTARG};;
    esac
done 

docker exec instance$instance-jedai-1 cat out.txt
