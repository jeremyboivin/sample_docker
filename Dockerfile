# This Dockerfile is a sample
# It mount a virtual docker environment based on python3.4
# Copyright BOIVIN Jérémy - 2018

FROM debian:jessie

# SET BACKPORTS INTO SOURCE LIST
RUN echo "deb http://deb.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

# LAUNCH UPDATES
RUN apt-get -y update && apt-get upgrade -y

# GET PYTHON AND REDIS 
# (FOR EXAMPLE, SOME ELSE EXISTING ON https://docs.docker.com/samples/library/)
RUN apt-get install -y python3 python3-dev python3-pip
RUN apt-get install -y redis-tools

RUN python3 -m pip install pip setuptools virtualenv --upgrade

# SET ENVIRONMENT VARIABLE
ENV ENVVARGLOBAL='VALUE'

# YOU CAN RUN ALL LINUX COMMANDS
RUN mkdir /shared
RUN touch /sample.txt

# PERSONALIZED COMMANDS ALSO EXISTS INTO DOCKER
COPY . /shared/
COPY sample_file.py /sample_file.py


RUN mkdir -p /pyenv/ && \
    virtualenv -p $(which python3) /pyenv/project && \
    echo "source /pyenv/project/bin/activate" >> /root/.bashrc && \
    /pyenv/project/bin/pip install pip setuptools --upgrade

RUN cd /shared && /pyenv/project/bin/pip install --quiet -r requirements.txt
RUN cd /shared && /pyenv/project/bin/python setup.py develop

VOLUME ["/shared"]
WORKDIR /shared