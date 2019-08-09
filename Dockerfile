FROM ubuntu:18.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y \
      python3 \
      python3-pip && \
    apt-get clean

COPY requirements.txt /tmp/requirements.txt 

RUN python3 -m pip install -r /tmp/requirements.txt

COPY . /opt/docker-class

WORKDIR /opt/docker-class

ENTRYPOINT python3 app/main.py

