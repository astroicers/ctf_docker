MOD_SET

-rw-r--r--   auth        
-r--r-----   flag        
-rwxr-sr-x   justno
-rw-r--r--   justno.c    

Docker for Flask
==================== 

### Dockerfile
```
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
```


### Build 
```sh
docker build -t ctf_docker .
```

### Run
```sh
docker run -d -it astroicers/ctf_docker
```
