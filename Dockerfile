FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN apt-get install sudo -y
RUN apt-get install -y vim
RUN useradd -ms /bin/bash ctf_user && \
    useradd -ms /bin/bash ctf_loser
WORKDIR /home/ctf_user
WORKDIR /home/ctf_loser
COPY ./ /problems/binaryexploitation
WORKDIR /problems/binaryexploitation
RUN gcc -o bashloop bashloop.c && \
    chown ctf_user flag && \
    chown ctf_user bashloop && \
    chgrp ctf_user flag && \
    chgrp ctf_user bashloop && \
    chmod 440 flag && \
    chmod 2755 bashloop && \
    rm bashloop.c
USER ctf_loser
