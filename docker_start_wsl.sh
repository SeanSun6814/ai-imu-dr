{
    docker kill ai_imu_dev || true
    docker rm ai_imu_dev
} &> /dev/null

docker run \
-it \
--name ai_imu_dev \
-v $(readlink -f "./.")/src:/ai-imu-dr/src \
-p 8000-8001:8000-8001 \
-e "DISPLAY" \
-e "QT_X11_NO_MITSHM=1" \
-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--privileged \
ai_imu:latest