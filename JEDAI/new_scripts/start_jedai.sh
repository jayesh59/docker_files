#!/bin/bash

export NOVNC_PORT=8200 JEDAI_PORT=8000
base_novnc=$NOVNC_PORT
base_jedai=$JEDAI_PORT
i=0
user=$USER

if [[ "$user" == "ayang46" ]]; then
    i=1
elif [[ "$user" == "npoluri" ]]; then
    i=2
elif [[ "$user" == "akathula" ]]; then
    i=3
elif [[ "$user" == "jnagpal1" ]]; then
    i=4
elif [[ "$user" == "rkaria" ]]; then
    i=5
else
    echo "Invalid user. Please contact admins to add you to the jedai account"
    exit 1
fi

novnc_port=$(($base_novnc + $i))
jedai_port=$(($base_jedai + $i))

NOVNC_PORT=$novnc_port JEDAI_PORT=$jedai_port && docker compose -p $USER up -d

hostname=$(hostname)
echo "Jedai.ed link = http://$hostname.cidse.dhcp.asu.edu:$jedai_port"
