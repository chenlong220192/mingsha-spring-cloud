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

APPNAME=$1
VERSION=$2
PORT=$3
IP=$4

if [ $PORT = false ];then
  docker run -d \
    --network=network4cloud \
    -v volume4cloud:/data \
    --memory 1024m \
    --restart=always \
    --name cloud-mingsha-service-${APPNAME} \
    site.mingsha/mingsha-service-${APPNAME}:${VERSION}

else
  docker run -d \
    --network=network4cloud \
    --ip=${IP} \
    -p ${PORT}:${PORT} \
    -v volume4cloud:/data \
    --memory 1024m \
    --restart=always \
    --name cloud-mingsha-service-${APPNAME} \
    site.mingsha/mingsha-service-${APPNAME}:${VERSION}
fi
