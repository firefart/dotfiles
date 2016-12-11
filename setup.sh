#!/bin/bash

BASEDIR=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")
# remove slash
BASEDIR=${BASEDIR%/}

echo "Basedir: $BASEDIR"

git submodule init
git submodule update

# git
ln -fs $BASEDIR/gitconfig ~/.gitconfig

# tmux
ln -fs $BASEDIR/tmux.conf ~/.tmux.conf

# vim
mkdir -p ~/.vim/
ln -fs $BASEDIR/vim/vimrc ~/.vimrc

# pathogen
ln -fs $BASEDIR/vim/plugins/vim-pathogen/autoload ~/.vim/

# plugins
ln -fs $BASEDIR/vim/plugins/lightline.vim ~/.vim/bundle
ln -fs $BASEDIR/vim/plugins/supertab ~/.vim/bundle
# http://vimawesome.com/plugin/the-nerd-commenter

mkdir -p ~/.vim/colors
ln -fs $BASEDIR/vim/colors/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
