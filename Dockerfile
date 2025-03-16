# Base image
FROM ros:foxy

# Install dependencies
RUN apt-get update && apt-get install -y \
    ros-foxy-rclcpp \
    ros-foxy-std-msgs \
    python3-colcon-common-extensions \
    clang-format \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Create workspace
WORKDIR /root/ros2_ws
RUN mkdir -p src

# Copy package
COPY ./talker_cpp /root/ros2_ws/src/talker_cpp
COPY .vscode /root/ros2_ws/.vscode
COPY .clang-format /root/ros2_ws/.clang-format
COPY .cmake-format.py /root/ros2_ws/.cmake-format.py

# Source ROS 2 and build
RUN /bin/bash -c "source /opt/ros/foxy/setup.bash && colcon build --packages-select talker_cpp"

# Ensure `install/setup.bash` exists
RUN test -f /root/ros2_ws/install/setup.bash || (echo 'Build failed: setup.bash not found' && exit 1)

# Source entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
