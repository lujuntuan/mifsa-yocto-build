#!/bin/bash
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

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PROXY_STR=

mkdir -p $CURRENT_DIR/work
cd $CURRENT_DIR/work

set_proxy(){
    echo "*** set proxy..."
    PROXY_STR="-e http_proxy=$1 -e https_proxy=$1 -e all_proxy=$1 -e ALL_PROXY=$1"
    export http_proxy=$1
    export https_proxy=$1
    export all_proxy=$1
    export ALL_PROXY=$1
}

if [ ! -z $all_proxy ];then
    set_proxy $all_proxy
elif [ ! -z $ALL_PROXY ];then
    set_proxy $ALL_PROXY
elif [ ! -z $http_proxy ];then
    set_proxy $http_proxy
elif [ ! -z $HTTP_PROXY ];then
    set_proxy $HTTP_PROXY
elif [ ! -z $https_proxy ];then
    set_proxy $https_proxy
elif [ ! -z $HTTPS_PROXY ];then
    set_proxy $HTTPS_PROXY
elif [ ! -z $socks_proxy ];then
    set_proxy $socks_proxy
elif [ ! -z $SOCKS_PROXY ];then
    set_proxy $SOCKS_PROXY
fi

echo "*** create docker..."
docker images -a | grep -q ubuntu_mifsa_yocto
if [ $? -ne 0  ];then
    docker build -t ubuntu_mifsa_yocto:18.04 $CURRENT_DIR/docker
    [ $? -ne 0 ] && echo "!!! create docker error !!!" && exit 1
fi

echo "*** download repos..."
vcs import $CURRENT_DIR/work < $CURRENT_DIR/repos/mifsa-build.repo
[ $? -ne 0 ] && echo "!!! download meta error !!!" && exit 1

echo "*** run docker..."
docker ps -a | grep -q ubuntu_mifsa_yocto
if [ $? -ne 0 ];then
    docker run -it --rm \
    -v $CURRENT_DIR/work:/work \
    --privileged \
    -e "TEMPLATECONF=/work/meta-mifsa/conf/template/qemu" $PROXY_STR \
    ubuntu_mifsa_yocto:18.04 \
    /bin/bash
fi

echo "done!"
