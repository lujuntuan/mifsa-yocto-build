# MIFSA-YOCTO-BUILD

This is a simple project for mifsa compilation, 

first it downloads the meta-layer for yocto and the mifsa code, 

then it starts docker for yocto compilation.

[poky](https://github.com/yoctoproject/poky)

[meta-mifsa](https://github.com/lujuntuan/meta-mifsa)

[meta-openembedded](https://github.com/openembedded/meta-openembedded)

[src/mifsa/mifsa-base](https://github.com/lujuntuan/mifsa-base)

[src/mifsa/mifsa-gnss](https://github.com/lujuntuan/mifsa-gnss)

[src/mifsa/mifsa-ota](https://github.com/lujuntuan/mifsa-ota)

## How to use

Install vcstool for ubuntu

- sudo apt-get install python-vcstool

Install docker for ubuntu:
- sudo apt-get install docker-ce
- sudo systemctl enable docker
- sudo groupadd docker
- sudo usermod -aG docker $USER
- sudo gpasswd -a $USER docker
- sudo systemctl restart docker
- (you need to reboot or log out)

Set the proxy if you need, for example:

- export all_proxy=127.0.0.1:1080

Run scripts:

- docker-build.sh
- source poky/oe-init-build-env
- bitbake mifsa-image-qemu
- runqemu nographic slirp

Note: qemu login: root , qemu password: mifsa

## Copyright:

Juntuan.Lu, 2020-2030, All rights reserved.
