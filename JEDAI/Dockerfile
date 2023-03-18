# FROM openrave:working
FROM jedai:dev
# FROM osrf/ros:melodic-desktop-full-bionic
# ARG DEBIAN_FRONTEND=noninteractive
# ARG RAVE_COMMIT=7c5f5e27eec2b2ef10aa63fbc519a998c276f908
# ARG OSG_COMMIT=1f89e6eb1087add6cd9c743ab07a5bce53b2f480
# ARG BOOST_SRC_DIR=~/git/boost_1_58_0
# ENV QT_X11_NO_MITSHM=1

# #installing JEDAI dependencies
# RUN apt-get update && \
#     apt-get install python3 python3-pip xdg-utils -y
# RUN pip3 install django PyYAML==5.4.1 tarski pddlpy antlr4-python3-runtime==4.9.3 Pillow

# #downloading the git repo and firefox
# RUN cd ~/git && \
#     git clone https://github.com/AAIR-lab/AAIR-JEDAI.git 
# RUN cd ~/git/AAIR-JEDAI && \
#     git clone https://github.com/AAIR-lab/ATAM.git TMP_Merged && \
#     cd TMP_Merged && git checkout origin/TMP_JEDAI
# RUN cd ~/ && \
#     git clone https://github.com/KCL-Planning/VAL && \
#     cd VAL && \
#     scripts/linux/build_linux64.sh all Release
# RUN apt-get update && apt-get install net-tools -y

#installing nodejs and related stuff
# RUN apt-get update && \
#     apt-get install python-tk curl -y
# RUN cd ~ && \ 
#     curl -sL https://deb.nodesource.com/setup_17.x -o /tmp/nodesource_setup.sh && \
#     bash /tmp/nodesource_setup.sh && \
#     apt install nodejs -y
# ENTRYPOINT [ "./start_jedai.sh" ]
WORKDIR /root/git/JEDAI/
EXPOSE 8000