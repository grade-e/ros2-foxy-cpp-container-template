from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='talker_cpp',
            executable='talker',
            name='talker',
            output='screen',
            )
    ])