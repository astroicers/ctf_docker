FROM ubuntu:16.04
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
RUN apt-get install sudo -y
RUN apt-get install -y vim
COPY ./ /problems/binaryexploitation
WORKDIR /problems/binaryexploitation
RUN gcc -o justno justno.c
RUN chmod 644 auth && chmod 440 flag && chmod 2755 justno && chmod 633 justno.c
RUN useradd -ms /bin/bash ctf_user
USER ctf_user
WORKDIR /home/ctf_user
WORKDIR /problems/binaryexploitation


-rw-r--r--   1 hacksports just-no_7     2 Mar 31  2017 auth        
-r--r-----   1 hacksports just-no_7    33 Mar 31  2017 flag        
-rwxr-sr-x   1 hacksports just-no_7  7800 Mar 31  2017 justno
-rw-r--r--   1 hacksports just-no_7   838 Mar 31  2017 justno.c
