#!/bin/bash

BASEDIR=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")

echo "Basedir: $BASEDIR"

# tmux
ln -fs $BASEDIR/tmux.conf ~/.tmux.conf

# vim
ln -fs $BASEDIR/vimrc ~/.vimrc

# pathogen
mkdir -p ~/.vim/autoload && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

ln -fs $BASEDIR/bundle ~/.vim/

