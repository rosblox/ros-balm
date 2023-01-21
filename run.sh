#!/bin/bash

xhost +

docker run -it --rm --privileged --net=host \
--volume $(pwd)/BALM:/catkin_ws/src/BALM \
-e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
ghcr.io/rosblox/ros-balm:noetic

