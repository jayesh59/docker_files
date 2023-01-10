FROM osrf/ros:melodic-desktop-full-bionic
ARG DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    g++ \
    cmake \
    python-pip \
    python-scipy \
    coreutils \
    nano

RUN apt-get update
RUN apt-get install -y xauth
RUN apt-get install -y xorg openbox