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

loading_animation() {
  local interval=1
  local duration=30
  local bar_length=$(tput cols)  # Get terminal window width
  local total_frames=$((duration * interval))
  local frame_chars=("█" "▉" "▊" "▋" "▌" "▍" "▎" "▏")

  for ((i = 0; i <= total_frames; i++)); do
    local frame_index=$((i % ${#frame_chars[@]}))
    local progress=$((i * bar_length / total_frames))
    local bar=""
    for ((j = 0; j < bar_length; j++)); do
      if ((j <= progress)); then
        bar+="${frame_chars[frame_index]}"
      else
        bar+=" "
      fi
    done
    printf "\r\033[32m%s\033[0m" "$bar"  # Print in green color
    sleep 0.$interval
  done

  printf "\n"
}

text_art="

██████╗░░█████╗░██╗██████╗░██╗████████╗  ███╗░░░███╗░░░░░██╗  ██╗░░░░░███████╗███████╗
██╔══██╗██╔══██╗╚═╝██╔══██╗██║╚══██╔══╝  ████╗░████║░░░░░██║  ██║░░░░░██╔════╝██╔════╝
██████╔╝██║░░██║░░░██████╦╝██║░░░██║░░░  ██╔████╔██║░░░░░██║  ██║░░░░░█████╗░░█████╗░░
██╔══██╗██║░░██║░░░██╔══██╗██║░░░██║░░░  ██║╚██╔╝██║██╗░░██║  ██║░░░░░██╔══╝░░██╔══╝░░
██║░░██║╚█████╔╝██╗██████╦╝██║░░░██║░░░  ██║░╚═╝░██║╚█████╔╝  ███████╗███████╗███████╗
╚═╝░░╚═╝░╚════╝░╚═╝╚═════╝░╚═╝░░░╚═╝░░░  ╚═╝░░░░░╚═╝░╚════╝░  ╚══════╝╚══════╝╚══════╝

░█████╗░░█████╗░████████╗██╗░░██╗██╗███╗░░██╗  ░█████╗░██████╗░███████╗░█████╗░████████╗███████╗
██╔══██╗██╔══██╗╚══██╔══╝██║░██╔╝██║████╗░██║  ██╔══██╗██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝
██║░░╚═╝███████║░░░██║░░░█████═╝░██║██╔██╗██║  ██║░░╚═╝██████╔╝█████╗░░███████║░░░██║░░░█████╗░░
██║░░██╗██╔══██║░░░██║░░░██╔═██╗░██║██║╚████║  ██║░░██╗██╔══██╗██╔══╝░░██╔══██║░░░██║░░░██╔══╝░░
╚█████╔╝██║░░██║░░░██║░░░██║░╚██╗██║██║░╚███║  ╚█████╔╝██║░░██║███████╗██║░░██║░░░██║░░░███████╗
░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝  ░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝

░██████╗░████████╗  ██████╗░██╗░░██╗░██████╗░
██╔═══██╗╚══██╔══╝  ██╔══██╗██║░██╔╝██╔════╝░
██║██╗██║░░░██║░░░  ██████╔╝█████═╝░██║░░██╗░
╚██████╔╝░░░██║░░░  ██╔═══╝░██╔═██╗░██║░░╚██╗
░╚═██╔═╝░░░░██║░░░  ██║░░░░░██║░╚██╗╚██████╔╝
░░░╚═╝░░░░░░╚═╝░░░  ╚═╝░░░░░╚═╝░░╚═╝░╚═════╝░
"

resize -s 72 240

terminal_width=$(tput cols)
padding_length=$(( (terminal_width - ${#text_art}) / 2 ))
padding=$(printf "%*s" $padding_length "")

echo -e "\033[38;5;208m$padding$text_art\033[0m"
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