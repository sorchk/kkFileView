
docker run --rm -it \
--name kkfileview \
-p 8012:8012 \
-e "TZ=Asia/Shanghai" \
sorc/kkfileview:latest


docker run -d \
--name kkfileview \
-p 8012:8012 \
-e "TZ=Asia/Shanghai" \
sorc/kkfileview:latest