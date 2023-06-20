# Build docker

```bash
docker build -t ai_imu:latest .
```


# Launch docker

```bash
docker run \
-it \
--name ai_imu_dev \
-v $(readlink -f "./."):/ai-imu-dr \
-p 8000-8001:8000-8001 \
-e "DISPLAY" \
-e "QT_X11_NO_MITSHM=1" \
-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--privileged \
ai_imu:latest
```