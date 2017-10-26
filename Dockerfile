FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN apt-get install sudo -y
RUN apt-get install -y vim
COPY ./ /problems/binaryexploitation
WORKDIR /problems/binaryexploitation
RUN gcc -o justno justno.c
RUN chmod 311 auth && chmod 110 flag && chmod 2755 justno && chmod 311 justno.c
RUN useradd -ms /bin/bash ctf_user
USER ctf_user
WORKDIR /home/ctf_user
WORKDIR /problems/binaryexploitation
