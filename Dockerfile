# build
# docker build -t mednafen:latest . 

# copy executable out of container 
# docker run --rm -v $(pwd):/host mednafen:latest /bin/bash -c "/host/copy.sh"

FROM ubuntu:latest
RUN apt-get update 
RUN apt-get install -y build-essential pkg-config libasound2-dev libsdl2-dev libflac-dev zlib1g-dev wget unzip
RUN wget https://github.com/sozud/mednafen-git/archive/refs/heads/master.zip && \
    unzip master.zip
RUN cd mednafen-git-master && \
    ./configure --enable-apple2=no --enable-gb=no --enable-gba=no --enable-lynx=no --enable-md=no --enable-nes=no --enable-ngp=no --enable-pce=no --enable-pce-fast=no --enable-pcfx=no --enable-sasplay=no --enable-sms=no --enable-snes=no --enable-snes-faust=no --enable-ss=no --enable-ssfplay=no --enable-vb=no --enable-wswan=no --enable-fancy-scalers=no  --enable-debugger=yes && \
    make 
