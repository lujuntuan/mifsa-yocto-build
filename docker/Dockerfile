#*********************************************************************************
#  *Copyright(C): Juntuan.Lu, 2020-2030, All rights reserved.
#  *Author:  Juntuan.Lu
#  *Version: 1.0
#  *Date:  2022/04/01
#  *Email: 931852884@qq.com
#  *Description:
#  *Others:
#  *Function List:
#  *History:
#**********************************************************************************

FROM ubuntu:18.04

COPY sources.list /etc/apt/sources.list
COPY oe-git-proxy /usr/bin/oe-git-proxy

ARG USERNAME=yocto
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG USER_PASSWORD=123456
ARG ROOT_PASSWORD=$USER_PASSWORD

RUN groupadd --gid $USER_GID $USERNAME && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    echo "root:$ROOT_PASSWORD" | chpasswd && \
    echo "$USERNAME:$USER_PASSWORD" | chpasswd

RUN apt-get update && \
    apt-get install -y \
        sudo \
        gawk \
        wget \
        git-core \
        subversion \
        diffstat \
        unzip \
        sysstat \
        texinfo \
        build-essential \
        chrpath \
        socat \
        python \
        python3 \
        python3-distutils \
        xz-utils  \
        locales \
        cpio \
        screen \
        tmux \
        iputils-ping \
        iproute2 \
        fluxbox \
        tightvncserver \
        liblz4-tool \
        zstd \
        net-tools \
        file \
        ca-certificates \
        kmod \
        cmake \
        vim && \
    apt-get clean

RUN /usr/sbin/locale-gen en_US.UTF-8
RUN touch /etc/sudoers && echo "\n$USERNAME ALL=(ALL) ALL\n" >> /etc/sudoers
RUN mkdir -p /work && chown $USER_UID:$USER_UID /work
RUN echo "\n[ -f /dev/net/tun ] && chmod 666 /dev/net/tun\n" >> /etc/init.d/kmod

ENV LANG="en_US.UTF-8"
ENV GIT_PROXY_COMMAND="oe-git-proxy"

USER $USERNAME
WORKDIR /work
CMD /bin/bash
