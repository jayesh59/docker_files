## one to be used for pybullet version of TMP
## should be names pybullet:tmp
FROM ros:melodic-ros-core-bionic

ARG DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1
ENV LC_ALL="en_US.UTF-8"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

RUN apt update && \
    apt install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install -y python3

RUN apt-get update && \
    apt-get install python3-rosdep && \
    rosdep init && rosdep update
    
RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    g++ \
    python3-pip \
    coreutils \
    nano \
    vim \
    mesa-utils \
    tmux \
    libyaml-cpp-dev \
    python3-wstool \
    python3-empy \
    python3-nose \
    libgtest-dev \
    ros-cmake-modules \
    libkdl-parser-dev \
    libnlopt-dev \
    liborocos-kdl-dev \
    liburdfdom-dev \
    swig \
    ros-melodic-moveit-core \
    ros-melodic-tf-* \
    python3-catkin-pkg-modules \
    python3-rospkg-modules \
    net-tools

RUN apt-get install -y --no-install-recommends build-essential doxygen \
    octave python3.6-dev python3-setuptools wget mlocate python3-tk
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
RUN python3.6 -m pip install pyopengl
RUN apt install -y libgsl-dev
RUN python3.6 -m pip install pydot python-dotenv
RUN apt-get install python3-numpy
RUN python3.6 -m pip install -I cython numpy pybind11 
RUN python3.6 -m pip install pygccxml pyplusplus 
RUN python3.6 -m pip install setuptools --upgrade
RUN python3.6 -m pip install versioneer tqdm
RUN python3.6 -m pip install -U pybullet
RUN python3.6 -m pip install scipy==1.5.0 pyyaml==5.4.1
RUN python3.6 -m pip install catkin_tools catkin_pkg

#downloading latest cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.26.4/cmake-3.26.4-linux-x86_64.tar.gz && \
    tar zxvf cmake-3.26.4-linux-x86_64.tar.gz && \
    mv cmake-3.26.4-linux-x86_64     /opt/cmake-3.26.4 &&\
    ln -sf  /opt/cmake-3.26.4/bin/*    /usr/bin/

RUN add-apt-repository ppa:pypy/ppa && \
    apt update && \
    apt install -y pypy3

#installing working version of castxml
RUN wget -O castxml-linux.tar.gz https://data.kitware.com/api/v1/item/63bed74d6d3fc641a02d7e98/download && \
    tar zxvf castxml-linux.tar.gz && \
    mv castxml ~/ && \
    echo "export PATH=${HOME}/castxml/bin:${PATH}" > ~/.bashrc

RUN mkdir -p ~/git && cd ~/git/ && \
    git clone https://github.com/ompl/ompl.git && \
    mkdir -p ompl/build/Release
    # cd ompl/build/Release/
    # cmake ../.. -DPYTHON_EXEC=/usr/bin/python3.6 && \
    # make update_bindings && \
    # make && make install

RUN apt-get update && apt-get install -y xauth
RUN apt-get install -y xorg openbox

#installing trac_ik and other ros independent packages    
RUN source /opt/ros/melodic/setup.bash && \
    mkdir -p ~/git/ros_independent_installs/src && cd ~/git/ros_independent_installs/src && \
    # git clone https://github.com/jayesh59/trac_ik.git && \
    # wstool init && \
    # wstool set -y src/geometry2 --git https://github.com/ros/geometry2 -v 0.6.7 && \
    # wstool up && \
    # rosdep install --from-paths src --ignore-src -y -r && \
    catkin_make --cmake-args \
            -DCMAKE_BUILD_TYPE=Release \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m \
            -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so
RUN echo "source ~/git/ros_independent_installs/devel/setup.bash" >> ~/.bashrc