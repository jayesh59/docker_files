#!/bin/bash

chmod u+x start_instances.sh stop_instances.sh get_out.sh post_processing.sh
docker load --input jedai_ed.tar
docker load --input novnc.tar