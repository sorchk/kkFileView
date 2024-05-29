#!/bin/bash
name=libreoffice
ver=$1
build_date=`date +"%Y%m%d"`
if [ -z "${ver}" ] ;then
  ver=7.5-jdk8
fi
echo ${ver}_${build_date}

echo ${DOCKER_HUB_KEY} | docker login --username ${docker_user}  --password-stdin
docker buildx build \
  --platform linux/arm64,linux/amd64 \
  --build-arg VER=${ver} \
  --build-arg BUILD_DATE=${build_date} \
  --build-arg HTTP_PROXY=http://172.168.1.237:1083 \
  --build-arg HTTPS_PROXY=http://172.168.1.237:1083 \
  --push \
  --tag sorc/${name}:${ver}_${build_date} \
  --tag sorc/${name}:${ver} \
  --tag sorc/${name}:latest .
