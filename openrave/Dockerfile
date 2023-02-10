# FROM ubuntu:18.04
FROM osrf/ros:melodic-desktop-full-bionic
ARG DEBIAN_FRONTEND=noninteractive
ARG RAVE_COMMIT=7c5f5e27eec2b2ef10aa63fbc519a998c276f908
ARG OSG_COMMIT=1f89e6eb1087add6cd9c743ab07a5bce53b2f480
ARG BOOST_SRC_DIR=~/git/boost_1_58_0
ENV QT_X11_NO_MITSHM=1

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
#installing Dependencies
RUN apt-get update && apt-get install -q -y \
    build-essential \
    git \
    gcc-4.8 \
    g++-4.8 \
    cmake \
    python-pip \
    python-scipy \
    coreutils \
    nano \
    vim

RUN apt-get install -y --no-install-recommends build-essential doxygen \
    octave python-dev python-setuptools wget mlocate python-tk
RUN apt-get install -y ros-melodic-chomp-motion-planner \
    ros-melodic-sbpl* \
    ros-melodic-ompl \
    ros-melodic-qt-ros
RUN apt-get install ros-melodic-chomp-motion-planner ros-melodic-sbpl* ros-melodic-ompl ros-melodic-trac-ik-* ros-melodic-srdfdom*  -y
RUN apt-get install liblapacke-dev libnewmat10*  libgsl-dev -y
RUN python2.7 -m pip install matplotlib==2.2.0 --user
RUN python2.7 -m pip install pydot==1.2.3
RUN python2 -m pip install enum34 --user
RUN python2 -m pip install networkx==2.2 --user
RUN apt-get install -y --no-install-recommends ipython python-h5py python-numpy \
    python-wheel qt4-dev-tools liblapacke-dev libnewmat10* 
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
RUN apt install -y libgsl-dev
RUN pip install tqdm

RUN mkdir -p ~/git; cd ~/git && \
   wget https://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.gz/download?use_mirror=autoselect -O ~/git/boost_1_58_0.tar.gz && \
   tar -xzf boost_1_58_0.tar.gz && \
   cd ~/git/boost_1_58_0/ && \
   ./bootstrap.sh --exec-prefix=/usr/local && \
   ./b2 -j `nproc` && \
   ./b2 -j `nproc` install threading=multi && \
   updatedb
    
# #install osg
RUN mkdir -p ~/git; cd ~/git && \
    git clone https://github.com/openscenegraph/OpenSceneGraph.git && \
    cd OpenSceneGraph; git reset --hard 1f89e6eb1087add6cd9c743ab07a5bce53b2f480 && \
    mkdir build; cd build && \
    cmake -DDESIRED_QT_VERSION=4 .. && \
    make -j `nproc` && make install && make install_ld_conf

# #install FCL
RUN mkdir -p ~/git; cd ~/git && \
    git clone https://github.com/flexible-collision-library/fcl && \
    cd fcl; git reset --hard 0.5.0 && \
    mkdir build; cd build && \
    cmake .. && \
    make -j `nproc` && \
    make install

# #installing Openrave
RUN pip install --upgrade --user sympy==0.7.1 && pip install numpy
RUN mkdir -p ~/git; cd ~/git && \
	git clone -b production https://github.com/rdiankov/openrave.git && \
    cd openrave; git reset --hard 7c5f5e27eec2b2ef10aa63fbc519a998c276f908 && \
    mkdir build; cd build && \
    cmake -DODE_USE_MULTITHREAD=ON -DCMAKE_CXX_STANDARD=11            \
        -DBoost_NO_SYSTEM_PATHS=TRUE -DBOOST_ROOT=/usr/local/ .. && \
    make -j `nproc` && \
    make install

# #setting up workspace
RUN apt-get update && apt-get install -y libompl12 python-catkin-tools && \
    apt update && apt install -y libompl-dev && \
    echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && \
    echo 'alias sb="source ~/.bashrc"' >> ~/.bashrc

RUN cd ~/git && \
    git clone https://github.com/AAIR-Lab/or_catkin.git && \
    mkdir -p ~/tmp_catkin_ws/src/ && \
    mv or_catkin/* ~/tmp_catkin_ws/src/

RUN source /opt/ros/melodic/setup.bash && \
    cd ~/tmp_catkin_ws/ && \
    catkin_make && \
    echo "source ~/tmp_catkin_ws/devel/setup.bash" >> ~/.bashrc
    
#install x11 files
RUN apt-get update
RUN apt-get install -y xauth
RUN apt-get install -y xorg openbox