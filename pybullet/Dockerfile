FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1
ENV LC_ALL="en_US.UTF-8"

RUN apt update && apt install python3 -y
RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    g++ \
    cmake \
    python3-pip \
    python3-scipy \
    coreutils \
    nano \
    vim \
    mesa-utils

RUN apt-get install -y --no-install-recommends build-essential doxygen \
    octave python3-dev python3-setuptools wget mlocate python3-tk
RUN apt-get install liblapacke-dev libnewmat10*  libgsl-dev -y
RUN apt-get install -y --no-install-recommends qt5-default minizip
RUN apt-get install -y --no-install-recommends ann-tools libann-dev            \
    libassimp-dev libavcodec-dev libavformat-dev libeigen3-dev libfaac-dev          \
    libflann-dev libfreetype6-dev liblapack-dev libglew-dev libgsm1-dev             \
    libmpfi-dev  libmpfr-dev liboctave-dev libode-dev libogg-dev libpcre3-dev       \
    libqhull-dev libswscale-dev libtinyxml-dev libvorbis-dev libx264-dev            \
    libxml2-dev libxvidcore-dev libbz2-dev libqt4-dev
RUN apt-get install -y --no-install-recommends libsoqt-dev-common libsoqt4-dev
RUN apt-get install -y --no-install-recommends libccd-dev                  \
    libcollada-dom2.4-dp-dev liblog4cxx-dev libminizip-dev octomap-tools
RUN apt-get install -y --no-install-recommends libboost-all-dev libboost-python-dev
RUN python3 -m pip install pyopengl
RUN apt install -y libgsl-dev
RUN python3 -m pip install setuptools --upgrade
RUN python3 -m pip install pydot python-dotenv
RUN apt-get install python3-numpy
RUN python3 -m pip install -I cython numpy
RUN python3 -m pip install pybind11 stable-baselines3 gym tqdm pybullet

RUN apt-get update
RUN apt-get install -y xauth
RUN apt-get install -y xorg openbox