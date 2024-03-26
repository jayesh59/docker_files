FROM osrf/ros:noetic-desktop-full-focal
ARG DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    g++ \
    cmake \
    python3-pip \
    python3-scipy \
    coreutils \
    nano \
    tmux \
    vim \
    wget \
    net-tools

RUN apt-get update
RUN apt-get install -y xauth
RUN apt-get install -y xorg openbox
