FROM rockylinux:9

RUN dnf install -y python3 python3-pip openssh-clients openssh-server sudo \
    && pip3 install ansible \
    && ssh-keygen -A \
    && mkdir /var/run/sshd \
    && echo 'root:root' | chpasswd \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]

