FROM alpine:3.14.0

LABEL maintainer="tviveiros@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for SSH Tunnel."

RUN apk update && apk upgrade && apk add openssh bash && \
    sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config   && \
    cd /etc/ssh/ && \
    ssh-keygen -A && \
    echo "root:Fuck!2021" | chpasswd   && \
    rm -rf /var/cache/apk/*

EXPOSE 22/tcp

CMD ["/usr/sbin/sshd", "-D"]