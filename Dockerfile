FROM ubuntu:latest

LABEL maintainer="tviveiros@gmail.com"
LABEL version="1.0"
LABEL description="This is custom Docker Image for SSH Tunnel."

RUN apt-get update && apt-get install -y openssh-server && rm -rf /var/lib/apt/lists/*
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 enkel 
RUN  echo 'enkel:enkel!2021' | chpasswd
RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]