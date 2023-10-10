make this alias -
    alias docker_run_x11="docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -h $HOSTNAME -v $HOME/.Xauthority:/root/.Xauthority -dit"

for nvidia gpu machine :
    https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

    then run the file with gpu
    use the docker compose file.

