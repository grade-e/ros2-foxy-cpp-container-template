# Base image
FROM ros:foxy

# Install dependencies
RUN apt-get update && apt-get install -y \
    ros-foxy-rclcpp \
    ros-foxy-std-msgs \
    python3-colcon-common-extensions \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Create workspace
WORKDIR /root/ros2_ws
RUN mkdir -p src

# Copy package
COPY ./talker_cpp /root/ros2_ws/src/talker_cpp

# Build package
RUN . /opt/ros/foxy/setup.sh && \
    colcon build --packages-select talker_cpp

# Source entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
