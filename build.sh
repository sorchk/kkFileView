#!/bin/bash
name=kkfileview
ver=$1
build_date=`date +"%Y%m%d"`
if [ -z "${ver}" ] ;then
  ver=4.4.0-beta
fi
echo ${ver}_${build_date}

docker login --username ${docker_user}  --password-stdin
docker buildx build \
  -f Dockerfile \
  --platform linux/arm64,linux/amd64 \
  --build-arg VER=${ver} \
  --build-arg BUILD_DATE=${build_date} \
  --push \
  --tag sorc/${name}:${ver}_${build_date} \
  --tag sorc/${name}:${ver} \
  --tag sorc/${name}:latest .
