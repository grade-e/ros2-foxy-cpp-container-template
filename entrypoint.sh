#!/bin/bash
set -e

# Source ROS 2
source /opt/ros/foxy/setup.bash

# Check if install/setup.bash exists, if not, build the workspace
if [ ! -f "/root/ros2_ws/install/setup.bash" ]; then
    echo "Warning: install/setup.bash not found. Running colcon build..."
    cd /root/ros2_ws
    colcon build
fi

# Source workspace
source /root/ros2_ws/install/setup.bash

exec "$@"