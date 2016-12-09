#!/bin/bash

BASEDIR=$(dirname "$0")

# tmux
ln -s "$BASEDIR/tmux.conf" "~/.tmux.conf"

# vim
ln -s "$BASEDIR/vimrc" "~/.vimrc"

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


