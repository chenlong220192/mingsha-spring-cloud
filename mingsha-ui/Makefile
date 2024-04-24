#======================================================================
#
# example 'make init'
# example 'make package SKIP_TEST=true ENV=dev'
#
# author: chenlong
# date: 2020-09-27
#======================================================================

SHELL := /bin/bash -o pipefail

export BASE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# ----------------------------- variables <-----------------------------
# 构建环境 stage or prod
ENV ?= prod
# docker镜像版本号
VERSION ?= v1.0.0
# docker容器映射端口
PORT ?= 8000
# docker容器IP
IP ?= false
# ----------------------------- variables >-----------------------------

# ----------------------------- local <-----------------------------
#
install:
	npm install --registry=https://registry.npmmirror.com

#
run:
	npm run dev

#
package:
	npm run build:${ENV}
# ----------------------------- local  >-----------------------------


# ----------------------------- docker <-----------------------------
#
docker.build:
	sh ${BASE_PATH}/deploy/bin/build.sh ${VERSION}

#
docker.run:
	sh ${BASE_PATH}/deploy/bin/run.sh ${VERSION} ${PORT} ${IP}

#
docker.remove:
	sh ${BASE_PATH}/deploy/bin/remove.sh

#
docker.go:
	make package docker.build docker.run ENV=prod VERSION=v1.0.0 IP=101.0.0.100
# ----------------------------- docker  >-----------------------------
