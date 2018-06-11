FROM consol/ubuntu-icewm-vnc:latest
MAINTAINER Phil Chin <ekkus93@gmail.com>

USER root

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install wget screen -y
RUN apt-get install lsb-core -y

RUN apt-get install sudo -y
RUN apt-get install terminator -y

# jdk
RUN apt-get install openjdk-8-jre-headless openjdk-8-jdk-headless -y

#emacs
# update again otherwise emacs might fail to install
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install emacs -y --fix-missing

# utils, misc
RUN apt-get install zip unzip -y
RUN apt-get install libwebkitgtk-1.0.0 -y

COPY ./version.txt /tmp/version.txt

RUN useradd -ms /bin/bash ubuntu
#RUN usermod -aG sudo ubuntu
RUN echo "ubuntu ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu && \
    chmod 0440 /etc/sudoers.d/ubuntu
RUN mkdir -p /home/ubuntu/work && chown ubuntu /home/ubuntu

# kettle
RUN mkdir -p /home/ubuntu/kettle
COPY ./pdi-ce-8.1.0.0-365.zip /home/ubuntu/kettle/pdi-ce-8.1.0.0-365.zip
RUN cd /home/ubuntu/kettle && unzip pdi-ce-8.1.0.0-365.zip && rm -rf pdi-ce-8.1.0.0-365.zip

VOLUME ["/home/ubuntu/work"]

USER ubuntu

WORKDIR /home/ubuntu/work


