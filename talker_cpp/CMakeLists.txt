cmake_minimum_required(VERSION 3.10)
project(talker_cpp)

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

add_executable(talker src/MinimalPublisher.cc)
target_include_directories(talker PUBLIC ${CMAKE_SOURCE_DIR}/include)
ament_target_dependencies(talker rclcpp std_msgs)

install(TARGETS
talker
  DESTINATION lib/${PROJECT_NAME}
)

install(DIRECTORY
  launch
  DESTINATION share/${PROJECT_NAME}
)

ament_package()
