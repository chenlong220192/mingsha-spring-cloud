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
# unit test flag
SKIP_TEST ?= false
# mingsha-service包内应用名，简写。例如：provider
APPNAME ?= provider
# jar包版本
VERSION ?= v1.0.0
# SonarQube
SONAR_TOKEN ?= sqp_5dea11320be00b624828d5bab974092557debadf
SONAR_KEY ?= cloud
SONAR_URL ?= http://101.0.0.26:9000
# docker容器映射端口
PORT ?= false
# docker容器IP
IP ?= false
# ----------------------------- variables >-----------------------------

# ----------------------------- maven <-----------------------------
# maven原生插件，用以清理工作空间。
clean:
	$(BASE_PATH)/mvnw --batch-mode --errors -f ${BASE_PATH}/pom.xml clean

# maven原生插件，用以执行单元测试相关代码。
test:
	$(BASE_PATH)/mvnw --batch-mode --errors --fail-at-end -f ${BASE_PATH}/pom.xml clean test -D maven.test.skip=false

#
package:
	$(BASE_PATH)/mvnw --batch-mode --errors --fail-at-end -f ${BASE_PATH}/pom.xml clean package -D maven.test.skip=$(SKIP_TEST)

# sonarqube漏洞扫描
# ${TOKEN}需要提前在SonarQube平台生成。
test-sonarqube:
	$(BASE_PATH)/mvnw --batch-mode --errors --fail-at-end -f ${BASE_PATH}/pom.xml clean verify sonar:sonar -Dsonar.projectKey=${SONAR_KEY} -Dsonar.host.url=${SONAR_URL} -Dsonar.login=${SONAR_TOKEN}

# 本地部署应用
startup:
	sh ${BASE_PATH}/deploy/deploy/startup.sh ${APPNAME} ${VERSION}

# 本地部署应用 for skywalking
# skywalking-agent已经预先放在/skywalking-agent目录下，可以/mingsha-spring-cloud/deploy/deploy/startup-skywalking.sh中修改。
startup-skywalking:
	sh ${BASE_PATH}/deploy/deploy/startup-skywalking.sh ${APPNAME} ${VERSION}
# ----------------------------- maven >-----------------------------

# ----------------------------- docker <-----------------------------
# docker环境构建镜像
# 参见 docker.go
docker.build:
	sh ${BASE_PATH}/deploy/bin/build.sh ${APPNAME} ${VERSION}

# docker环境构建镜像
# 参见 docker.go-skywalking
docker.build-skywalking:
	sh ${BASE_PATH}/deploy/bin/build-skywalking.sh ${APPNAME} ${VERSION}

# docker环境运行应用
# 参见docker.go and docker.go-skywalking
docker.run:
	sh ${BASE_PATH}/deploy/bin/run.sh ${APPNAME} ${VERSION} ${PORT} ${IP}

# docker环境移除应用
docker.remove:
	sh ${BASE_PATH}/deploy/bin/remove.sh ${APPNAME}

# docker环境一键部署
# 直接执行：make docker.go
docker.go: package
	make docker.build docker.run VERSION=v1.0.0 APPNAME=gateway      IP=101.0.0.101 PORT=8001
	make docker.build docker.run VERSION=v1.0.0 APPNAME=auth         IP=101.0.0.102 PORT=8002
	make docker.build docker.run VERSION=v1.0.0 APPNAME=system       IP=101.0.0.103 PORT=8003
	make docker.build docker.run VERSION=v1.0.0 APPNAME=file         IP=101.0.0.104 PORT=8004
	make docker.build docker.run VERSION=v1.0.0 APPNAME=generator    IP=101.0.0.105 PORT=8005
	# make docker.build docker.run VERSION=v1.0.0 APPNAME=message      IP=101.0.0.106 PORT=8006
	# make docker.build docker.run VERSION=v1.0.0 APPNAME=provider     IP=101.0.0.107 PORT=8007
	# make docker.build docker.run VERSION=v1.0.0 APPNAME=consumer     IP=101.0.0.108 PORT=8008
	# make docker.build docker.run VERSION=v1.0.0 APPNAME=monitor      IP=101.0.0.109 PORT=8009

# docker环境一键部署 for skywalking
# 直接执行：make docker.go-skywalking
docker.go-skywalking: package
	make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=gateway    IP=101.0.0.101 PORT=8001
	make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=auth       IP=101.0.0.102 PORT=8002
	make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=system     IP=101.0.0.103 PORT=8003
	make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=file       IP=101.0.0.104 PORT=8004
	make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=generator  IP=101.0.0.105 PORT=8005
	# make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=message    IP=101.0.0.106 PORT=8006
	# make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=provider   IP=101.0.0.107 PORT=8007
	# make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=consumer   IP=101.0.0.108 PORT=8008
	# make docker.build-skywalking docker.run VERSION=v1.0.0 APPNAME=monitor    IP=101.0.0.109 PORT=8009

# ----------------------------- docker  >-----------------------------
