# FROM ubuntu:bionic-20191202
FROM osrf/ros:kinetic-desktop-full-xenial
ARG DEBIAN_FRONTEND=noninteractive
ARG RAVE_COMMIT=2024b03554c8dd0e82ec1c48ae1eb6ed37d0aa6e
ARG OSG_COMMIT=1f89e6eb1087add6cd9c743ab07a5bce53b2f480
ENV QT_X11_NO_MITSHM=1

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#install collada-dom
RUN mkdir -p ~/git; cd ~/git && \
    git clone https://github.com/rdiankov/collada-dom.git && \
    cd collada-dom && mkdir build && cd build && \
    cmake .. && \
    make -j `nproc` && \
    make install

RUN mkdir -p ~/git; cd ~/git && \
    git clone https://github.com/crigroup/openrave-installation.git && \
    cd openrave-installation && \
    ./install-dependencies.sh && \
    ./install-osg.sh && \
    ./install-fcl.sh && \
    ./install-openrave.sh

#setting up workspace
RUN apt-get update && apt-get install -y libompl12 python-catkin-tools && \
    apt update && apt install -y libompl-dev && \
    echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc 

# WORKDIR /root
RUN mkdir workspaces && cd workspaces && \
    source /opt/ros/kinetic/setup.bash && \
    mkdir -p openrave_ws/src && \
    cd openrave_ws/src && \
    git clone https://github.com/personalrobotics/openrave_catkin.git && \
    git clone https://github.com/personalrobotics/or_ompl && \
    git clone https://github.com/personalrobotics/or_sbpl && \
    git clone https://github.com/personalrobotics/or_cdchomp && \
    git clone https://github.com/personalrobotics/comps && \
    git clone https://github.com/personalrobotics/prpy && \
    git clone https://github.com/personalrobotics/tsr && \
   # git clone https://github.com/personalrobotics/or_urdf.git && \
   # git clone https://github.com/ros-planning/srdfdom.git && \
   # cd srdfdom && git checkout kinetic-devel && \
   # cd ../../ && \
    cd .. && \
    catkin_make && \
    source devel/setup.bash

RUN echo "source /root/workspaces/openrave_ws/devel/setup.bash" >> ~/.bashrc

#install x11 files
RUN apt-get update
RUN apt-get install -y xauth
RUN apt-get install -y xorg openbox

WORKDIR /root/workspaces/openrave_ws/src