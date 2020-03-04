#!/bin/bash

BASEDIR=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")
# remove slash
BASEDIR=${BASEDIR%/}

echo "Basedir: $BASEDIR"

git submodule update --init --recursive

# tmux
ln -fs $BASEDIR/tmux.conf ~/.tmux.conf

# vim
rm -rf ~/.vim/
mkdir -p ~/.vim/
mkdir -p ~/.vim/pack/plugins
ln -fs $BASEDIR/vim/vimrc ~/.vimrc

# plugins
rm -rf ~/.vim/bundle
ln -fs $BASEDIR/vim/plugins/ ~/.vim/pack/plugins/start

# colors
mkdir -p ~/.vim/colors
ln -fs $BASEDIR/vim/colors/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim

# ssh
mkdir -p ~/.ssh/
ln -fs $BASEDIR/ssh_config ~/.ssh/config
chmod 600 ~/.ssh/config
chown $USER ~/.ssh/config

# curl
ln -fs $BASEDIR/curlrc ~/.curlrc

# inputrc
ln -fs $BASEDIR/inputrc ~/.inputrc
