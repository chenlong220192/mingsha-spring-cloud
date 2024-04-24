#! /bin/bash

#======================================================================
# author: chenlong
# date: 2024-04-09
#======================================================================

# bin目录绝对路径
BIN_PATH=$(cd `dirname $0`; pwd)
# 进入bin目录
cd `dirname $0`
# 返回到上一级项目根目录路径
cd ../../
# 打印项目根目录绝对路径
# `pwd` 执行系统命令并获得结果
BASE_PATH=`pwd`

VERSION=$1
PORT=$2
IP=$3

if [ $IP = false ];then
  docker run -d -it \
    --network=network4cloud \
    -p ${PORT}:${PORT} \
    --memory 128m \
    --restart=always \
    --name cloud-mingsha-ui \
    site.mingsha/mingsha-ui:${VERSION}
else
  docker run -d -it \
    --network=network4cloud \
    --ip=${IP} \
    -p ${PORT}:${PORT} \
    --memory 128m \
    --restart=always \
    --name cloud-mingsha-ui \
    site.mingsha/mingsha-ui:${VERSION}
fi
