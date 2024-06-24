#!/bin/bash

docker run -dit --name test_container jedai:squash
docker commit test_container jedai:$USER
docker stop test_container
docker container prune -f