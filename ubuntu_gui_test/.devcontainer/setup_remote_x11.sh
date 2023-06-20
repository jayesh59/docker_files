#!/bin/sh
export CONTAINER_DISPLAY=0
export CONTAINER_HOSTNAME="xterm"

# Create a directory for the socket
mkdir -p $HOME/display/socket
touch $HOME/display/Xauthority

# Get the DISPLAY slot
DISPLAY_NUMBER=$(echo $DISPLAY | cut -d. -f1 | cut -d: -f2)

# Extract current authentication cookie
AUTH_COOKIE=$(xauth list | grep "^$(hostname)/unix:${DISPLAY_NUMBER} " | awk '{print $3}')

# Create the new X Authority file
xauth -f $HOME/display/Xauthority add ${CONTAINER_HOSTNAME}/unix:${CONTAINER_DISPLAY} MIT-MAGIC-COOKIE-1 ${AUTH_COOKIE}

# Proxy with the :0 DISPLAY
socat UNIX-LISTEN:$HOME/display/socket/X${CONTAINER_DISPLAY},fork TCP4:localhost:60${DISPLAY_NUMBER} &