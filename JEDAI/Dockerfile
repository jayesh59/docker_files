FROM openrave:working
ARG DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

#installing JEDAI dependencies
RUN apt-get update && \
    apt-get install python3 python3-pip xdg-utils -y
RUN pip3 install django PyYAML tarski pddlpy antlr4-python3-runtime==4.7 Pillow

#downloading the git repo and firefox
RUN cd ~/git && \
    git clone https://github.com/AAIR-lab/AAIR-JEDAI.git 
RUN cd ~/git/AAIR-JEDAI && \
    git clone https://github.com/AAIR-lab/ATAM.git TMP_Merged && \
    cd TMP_Merged && git checkout origin/TMP_JEDAI
RUN apt-get update && apt-get install net-tools

WORKDIR /root/git/AAIR-JEDAI
EXPOSE 8000