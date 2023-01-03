# FROM ubuntu:18.04
FROM osrf/ros:melodic-desktop-full
ARG DEBIAN_FRONTEND=noninteractive
ENV RAVE_COMMIT=2024b03554c8dd0e82ec1c48ae1eb6ed37d0aa6e
ENV OSG_COMMIT=1f89e6eb1087add6cd9c743ab07a5bce53b2f480
ENV QT_X11_NO_MITSHM=1
#installing Dependencies
RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    g++ \
    cmake \
    python-pip \
    python-scipy \
    coreutils \
    nano
RUN apt-get install -y --no-install-recommends build-essential doxygen \
    octave python-dev python-setuptools wget mlocate
RUN apt-get install -y --no-install-recommends ipython python-h5py python-numpy \
    python-wheel qt4-dev-tools
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
RUN pip install pyopengl
RUN mkdir -p ~/git && \
    cd ~/git && git clone https://github.com/Tencent/rapidjson.git && \
    cd rapidjson && mkdir build && cd build && \
    cmake .. && make -j `nproc` && make install
RUN cd ~/git && git clone https://github.com/pybind/pybind11.git  && \
    cd pybind11 && \
    git config --local user.name crigroup && \
    git config --local user.email crigroup@example.com && \
    mkdir build && cd build && \
    git remote add woody https://github.com/woodychow/pybind11.git \
    && git remote add cielavenir https://github.com/cielavenir/pybind11.git \
    && git fetch woody && git fetch cielavenir && git checkout v2.2.4 \
    && git cherry-pick 94824d68a037d99253b92a5b260bb04907c42355 \
    && git cherry-pick 98c9f77e5481af4cbc7eb092e1866151461e3508 \
    && git cherry-pick dae2d434bd806eac67e38f3c49cfc91f46e4fd88 \
    && git cherry-pick 2e08ce9ba75f5a2d87a6f12e6ab657ac78444e8e \
    && cmake .. -DPYBIND11_TEST=OFF -DPythonLibsNew_FIND_VERSION=2 \
    && make install

#install collada-dom
RUN mkdir -p ~/git; cd ~/git && \
    git clone https://github.com/rdiankov/collada-dom.git && \
    cd collada-dom && mkdir build && cd build && \
    cmake .. && \
    make -j `nproc` && \
    make install

#install osg
RUN mkdir -p ~/git; cd ~/git && \
    git clone https://github.com/openscenegraph/OpenSceneGraph.git && \
    cd OpenSceneGraph; git reset --hard ${OSG_COMMIT} && \
    mkdir build; cd build && \
    cmake -DDESIRED_QT_VERSION=4 .. && \
    make -j `nproc` && make install && make install_ld_conf

#install FCL
RUN mkdir -p ~/git; cd ~/git && \
    git clone https://github.com/flexible-collision-library/fcl && \
    cd fcl; git reset --hard 0.5.0 && \
    mkdir build; cd build && \
    cmake .. -DFCL_BUILD_TESTS=OFF && \
    make -j `nproc` && \
    make install

#installing Openrave
RUN pip install --upgrade --user sympy==0.7.1 && pip install numpy
RUN mkdir -p ~/git; cd ~/git && \
	git clone -b production https://github.com/rdiankov/openrave.git && \
    cd openrave; git reset --hard ${RAVE_COMMIT} && \
    mkdir build; cd build && \
    cmake -DODE_USE_MULTITHREAD=ON -DOSG_DIR=/usr/local/lib64/ \
  		-DUSE_PYBIND11_PYTHON_BINDINGS=TRUE 			   \
  		-DBoost_NO_BOOST_CMAKE=1 .. && \
    make -j `nproc` && \
    make install

# #installing ROS Kinetic
# RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" >> /etc/apt/sources.list.d/ros-latest.list
# RUN apt install curl && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
#     apt-get update && \
#     apt-get install ros-kinetic-desktop-full && \
#     apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential && \
#     rosdep init && \
#     rosdep update && \
#     echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
# RUN source ~/.bashrc

#setting up workspace
WORKDIR /root
RUN mkdir workspaces && cd workspaces
RUN mkdir -p openrave_ws/src && \
    cd openrave_ws && \
    catkin_make && \
    source devel/setup.bash
RUN echo "source /root/workspaces/openrave_ws/devel/setup.bash" >> ~/.bashrc
RUN source ~/.bashrc
RUN cd src && git clone https://github.com/personalrobotics/openrave_catkin.git && \
    git clone https://github.com/personalrobotics/or_urdf.git && \
    # cd or_urdf && \
    # git checkout melodic_fixes && cd ../ && \
    catkin_make
RUN source devel/setup.bash
RUN apt-get install liblapacke-dev libnewmat10* 
RUN apt install libgsl-dev
RUN apt-get install ros-melodic-chomp-motion-planner && \
    ros-melodic-sbpl* && \
    ros-melodic-ompl
RUN python2 -m pip install enum34 --user
RUN python2 -m pip install networkx==2.2 --user
WORKDIR /root/workspaces/openrave_ws
RUN cd src && \
    git clone https://github.com/personalrobotics/or_ompl && \
    git clone https://github.com/personalrobotics/or_sbpl && \
    git clone https://github.com/personalrobotics/or_cdchomp && \
    git clone https://github.com/personalrobotics/comps && \
    git clone https://github.com/personalrobotics/prpy && \
    git clone https://github.com/personalrobotics/tsr
RUN cd .. && \
    catkin_make
RUN source devel/setup.bash

#install x11 files
RUN apt-get update
RUN apt-get install -y xauth
RUN apt-get install -y xorg openbox

WORKDIR /root/workspaces/openrave_ws/src