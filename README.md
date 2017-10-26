Docker for ctf_docker
==================== 

### Dockerfile
```
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
RUN chown ctf_user auth && chown ctf_user flag && chown ctf_user justno && chown ctf_user justno.c
RUN chgrp ctf_user auth && chgrp ctf_user flag && chgrp ctf_user justno && chgrp ctf_user justno.c
RUN chmod 644 auth && chmod 440 flag && chmod 2755 justno && chmod 644 justno.c
USER ctf_user
```

### MOD_SET

-rw-r--r--    auth        
-r--r-----     flag        
-rwxr-sr-x   justno
-rw-r--r--    justno.c    


### Build 
```sh
docker build -t ctf_docker .
```

### Run
```sh
docker run -d -it astroicers/ctf_docker
```

### QUESTION

1. Enter ```sh docker exec -it [your_container ID] bash```

2.Then go to ```sh /problems/binary_exploitation```

3.Get the flag !
