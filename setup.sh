#!/bin/bash
# Setup shell script for personal configuration

# shell script and dotfiles location
dotfiles_location="$(dirname $(readlink -f  $0))"

# include helper functions
. ${dotfiles_location}/helpers/shell_functions.sh

# bashrc configuration
setup_config "bash/bashrc" "~/.bashrc"
setup_config "bash/bash_git" "~/.bash_git"
setup_config "bash/bash_aliases" "~/.bash_aliases"
setup_config "bash/bash_functions" "~/.bash_functions"

# tmux configuration
setup_config "/tmux/tmux.conf" "~/.tmux.conf"
