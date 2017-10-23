FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y build-essential
COPY ./ /problems/binaryexploitation
WORKDIR /problems/binaryexploitation
RUN /bin/bash/gcc -o justno justno.c
