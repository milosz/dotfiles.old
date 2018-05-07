#!/bin/bash
# Setup shell script for personal configuration

# shell script and dotfiles location
os="$(uname -s)"
if [ "$os" == "Linux" ]; then
  dotfiles_location="$(dirname $(readlink -f  $0))"
elif [ "$os" == "Darwin" ]; then
  which greadlink >/dev/null
  if [ "$?" -eq "0" ]; then
    dotfiles_location="$(dirname $(greadlink -f  $0))"
  else
    echo "Please install coreutils (brew install coreutils)."
    exit 1
  fi
else
  echo "OS not supported"
  exit 1
fi

# include helper functions
. ${dotfiles_location}/helpers/shell_functions.sh

# bashrc configuration
setup_config "bash/bashrc" "~/.bashrc"
setup_config "bash/bash_git" "~/.bash_git"
setup_config "bash/bash_aliases" "~/.bash_aliases"
setup_config "bash/bash_functions" "~/.bash_functions"

# tmux configuration
setup_config "/tmux/tmux.conf" "~/.tmux.conf"

# vim configuration
setup_config "/vim/vimrc" "~/.vimrc"
