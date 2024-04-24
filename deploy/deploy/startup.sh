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

JAVA_OPT="-server -Xms256m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m"

java ${JAVA_OPT} \
            -jar \
            ${BASE_PATH}/mingsha-service/mingsha-service-${APPNAME}/target/mingsha-service-${APPNAME}-${VERSION}.jar
