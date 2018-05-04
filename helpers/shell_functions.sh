#!/bin/bash
# Shell functions used by setup process

# setup_config function to copy configuration file
# and move existing config if it exists
#
# it takes two parameters:
#   first:  source file
#   second: destination file
setup_config(){
  # require two parameters
  if [ "$#" -eq "2" ]; then
    # parameters
    source_file="${dotfiles_location}/${1}"
    eval "destination_file=$2"
    if  [ ! -L "$destination_file" ]; then
      if [ -e "$destination_file" ]; then
        mv "$destination_file" "${destination_file}.$(date +%y%m%d-%H%M%S)"
        if [ "$?" -gt "0" ]; then
      	  echo "Error renaming $destination_file"
	  exit 1
        fi
      fi
      ln -s "$source_file" "$destination_file"
      if [ "$?" -gt "0" ]; then
        echo "Error renaming $destination_file"
        exit 1
      fi
    fi
  fi
}
