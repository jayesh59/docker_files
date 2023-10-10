FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1
ENV LC_ALL="en_US.UTF-8"

RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    python3-pip \
    coreutils \
    nano \
    vim \
    tmux \
    curl \
    openssh-client \
    htop \
    mesa-utils

RUN apt-get update
RUN apt-get install -y xauth
RUN apt-get install -y xorg openbox

# RUN curl -sSL http://get.gazebosim.org | sh
