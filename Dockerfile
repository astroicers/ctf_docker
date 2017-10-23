FROM ubuntu:16.04
# ...
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /problems/binary_exploitation/
COPY . /problems/binary_exploitation/
RUN gcc -o justno justno.c
CMD ["./justno"]
