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

# ssh
mkdir -p ~/.ssh/
ln -fs $BASEDIR/ssh_config ~/.ssh/config

# vim
rm -rf ~/.vim/
mkdir -p ~/.vim/
mkdir -p ~/.vim/bundle/
ln -fs $BASEDIR/vim/vimrc ~/.vimrc

# pathogen
ln -fs $BASEDIR/vim/plugins/vim-pathogen/autoload ~/.vim/

# plugins
rm -rf ~/.vim/bundle
ln -fs $BASEDIR/vim/plugins/ ~/.vim/bundle

# colors
mkdir -p ~/.vim/colors
ln -fs $BASEDIR/vim/colors/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim

# powerline
cd $BASEDIR/powerline-shell
./install.py
ln -fs $BASEDIR/powerline-shell/powerline-shell.py ~/.powerline-shell.py

# bash
ln -fs $BASEDIR/aliases ~/.bash_aliases
ln -fs $BASEDIR/bashrc ~/.bashrc

