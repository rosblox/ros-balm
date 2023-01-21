FROM ros:noetic-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential wget \
    ros-${ROS_DISTRO}-eigen-conversions \
    ros-${ROS_DISTRO}-pcl-ros \
    ros-${ROS_DISTRO}-rviz \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /catkin_ws/src

COPY BALM BALM

WORKDIR /catkin_ws

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && catkin_make

WORKDIR /

COPY resources/ros_entrypoint.sh .

WORKDIR /catkin_ws

RUN echo 'alias build="catkin_make"' >> ~/.bashrc
RUN echo 'alias run="roslaunch balm2 consistency.launch"' >> ~/.bashrc
