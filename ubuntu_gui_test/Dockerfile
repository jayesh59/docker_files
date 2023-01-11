FROM ubuntu:bionic
ARG DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1
ENV LC_ALL="en_US.UTF-8"

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

RUN apt install -y firefox