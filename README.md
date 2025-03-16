# ros2-foxy-cpp-container-template

## ROS 2 Foxy Development Environment (VSCode + Docker)

This project provides a **Docker-based ROS 2 Foxy development environment** without requiring direct installation on Ubuntu 24.04.

It also integrates with VSCode **Dev Containers** to enable auto-completion (IntelliSense) and error detection.

## 🚀 Setup Instructions

### ✅ 1. Build the Docker Image

Run the following command to build the Docker image:

```bash
docker build -t ros2-foxy-dev .
```

### ✅ 2. Run VSCode Dev Containers

1. **Open the project folder in VSCode.**
2. **Click the “Reopen in Container” button in the bottom-left corner.**
3. Once the container starts, **the ROS 2 environment is automatically set up.**

If the setup does not start correctly, run:

```bash
Ctrl + Shift + P → "Remote-Containers: Rebuild and Reopen in Container"
```

### ✅ 3. Running and Testing the Container

To verify that the container is correctly set up, run the following commands inside the container:

```bash
source /opt/ros/foxy/setup.bash
source /root/ros2_ws/install/setup.bash
ros2 launch talker_cpp talker.launch.py
```

Now, you have a **fully functional ROS 2 Foxy development environment using VSCode and Docker!** 🚀
