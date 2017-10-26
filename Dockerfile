FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN apt-get install -y vim
WORKDIR /problems/binaryexploitation
COPY ./ /problems/binaryexploitation
RUN gcc -o justno justno.c

