# `catkin_create_qt_pkg` Script

### ROS2 Support!
https://github.com/mjlee111/ros2_create_qt_pkg.git

### Overview
The `catkin_create_qt_pkg` script helps in creating a ROS (Robot Operating System) package based on QT5 for GUI development. It automates the initial setup of the package and adds necessary dependencies, allowing developers to start working quickly.

## Installation
To use the script, clone the repository from GitHub and run the setup script to complete the necessary configuration.

```shell
$ git clone https://github.com/mjlee111/catkin_create_qt_pkg.git
$ cd catkin_create_qt_pkg
$ ./setup.sh
```

## Usage
To create a package, use the following command:
```shell 
$ catkin_create_qt_pkg [package_name] [dependencies]
```
- [package_name]: The name of the package you want to create.
- [dependencies]: Other ROS packages or QT modules that your package depends on, separated by spaces.

For example, to create a package named my_qt_package with dependencies roscpp and std_msgs, you would run:
```shell  
$ catkin_create_qt_pkg my_qt_package roscpp std_msgs
```

### test image
![Screenshot from 2023-09-13 04-52-27](https://github.com/mjlee111/catkin_create_qt_pkg/assets/66550892/72d2c9b1-016f-470c-a1bb-4c0c0ba37f5c)


![Screenshot from 2023-09-13 04-36-58](https://github.com/mjlee111/catkin_create_qt_pkg/assets/66550892/a969e5aa-dc85-46d5-b934-61495c8e2847)
