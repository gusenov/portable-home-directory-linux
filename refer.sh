#!/bin/bash
#set -x  # echo on

# Usage:
#  $ "./refer.sh"

function make_link() {
  local link_dir="$1"
  local target_file="$2"
  local link_file="$link_dir/$target_file"
  local current_dir=`pwd`

  #  file exists            file is a symbolic link
  if [ -e "$link_file" ] || [ -h "$link_file" ]; then
    echo "File $link_file already exists!"
  else
    ln --symbolic --force "$current_dir/$target_file" "$link_file"
  fi
}

home_dir="$HOME"

read -p "Is your home directory $home_dir? [Y/y] " -n 1 -r
echo  # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
  make_link "$home_dir" ".pypirc"
fi
