# MIFSA-BUILD

[Please click here](mifsa/README.md)

## How to use

Install docker for ubuntu:
- sudo apt-get install docker
- sudo service docker enable
- sudo groupadd docker
- sudo usermod -aG docker $USER
- sudo gpasswd -a $USER docker
- sudo service docker restart
- 'logout' or 'restart'

Run scripts
- yocto-run.sh [all_proxy] <!--For example, yocto-run.sh 127.0.0.1:1080-->
- source poky/oe-init-build-env
- bitbake mifsa-image-qemu
- runqemu nographic

## Copyright:

Juntuan.Lu, 2020-2030, All rights reserved.
