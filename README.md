# MIFSA-BUILD

This is a simple project for mifsa compilation, 

first it downloads the meta-layer for yocto and the mifsa source code, 

then it starts docker for yocto compilation.

[poky](https://github.com/yoctoproject/poky/README.md)

[meta-mifsa](https://github.com/lujuntuan/meta-mifsa/README.md)

[meta-openembedded](https://github.com/openembedded/meta-openembedded/README.md)

[src/mifsa](https://github.com/lujuntuan/mifsa/README.md)

## How to use

Install vcstool for ubuntu

- sudo apt-get install python-vcstool

Install docker for ubuntu:
- sudo apt-get install docker python-vcstool
- sudo service docker enable
- sudo groupadd docker
- sudo usermod -aG docker $USER
- sudo gpasswd -a $USER docker
- sudo service docker restart
- 'logout' or 'restart'

Set the proxy if you need, for example:

- export all_proxy=127.0.0.1:1080

Run scripts:

- yocto-run.sh
- source poky/oe-init-build-env
- bitbake mifsa-image-qemu
- runqemu nographic

## Copyright:

Juntuan.Lu, 2020-2030, All rights reserved.
