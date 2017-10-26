FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN apt-get install sudo -y
RUN apt-get install -y vim
RUN useradd -ms /bin/bash ctf_user
WORKDIR /home/ctf_user
COPY ./ /problems/binaryexploitation
WORKDIR /problems/binaryexploitation
RUN gcc -o justno justno.c
RUN chmod 644 auth && chmod 440 flag && chmod 2755 justno && chmod 644 justno.c
RUN chowner auth && chowner flag && chowner justno && chowner justno.c
RUN chogrp auth && chgrp flag && chgrp justno && chgrp justno.c
USER ctf_user

