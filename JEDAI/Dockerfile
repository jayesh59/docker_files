FROM openrave:working
ARG DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

#installing JEDAI dependencies
RUN apt-get update && \
    apt-get install python3 python3-pip xdg-utils -y
RUN pip3 install django PyYAML tarski pddlpy antlr4-python3-runtime==4.7 Pillow