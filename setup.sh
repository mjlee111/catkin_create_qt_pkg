#! /bin/bash

function custom_echo()
{
  text=$1
  color=$2

  case $color in
    "green")
      echo -e "\033[32m[MJLEE111] $text\033[0m"
      ;;
    "red")
      echo -e "\033[31m[MJLEE111] $text\033[0m"
      ;;
    *)
      echo "$text"
      ;;
  esac
}

custom_echo "Catkin_create_qt_pkg setup running ! " "green"
custom_echo "Moving scrips to ~/" "green"
cd ..
mv catkin_create_qt_pkg ~/.catkin_create_qt_pkg_scripts

echo 'catkin_create_qt_pkg() {
    local package_name="$1"
    shift 
    local dependencies="$@"
    local current_directory="$PWD"
    /home/"$USER"/.catkin_create_qt_pkg_scripts "$current_directory" "$package_name" "$dependencies"
}' >> ~/.bashrc
source ~/.bashrc

sudo apt-get -y install tree