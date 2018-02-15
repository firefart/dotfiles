#!/bin/bash

BASEDIR=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")
# remove slash
BASEDIR=${BASEDIR%/}

echo "Basedir: $BASEDIR"

git submodule update --init --recursive

# git
ln -fs $BASEDIR/gitconfig ~/.gitconfig

# tmux
ln -fs $BASEDIR/tmux.conf ~/.tmux.conf

# ssh
mkdir -p ~/.ssh/
ln -fs $BASEDIR/ssh_config ~/.ssh/config
chmod 600 ~/.ssh/config
chown $USER ~/.ssh/config

# bin
rm -rf ~/.local/bin
ln -fs $BASEDIR/bin/ ~/.local/bin

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

# powerline
cd $BASEDIR/powerline-shell
python ./setup.py install --user

# powerline fonts
mkdir -p ~/.local/share/fonts
ln -fs "$BASEDIR/powerline-fonts/DroidSansMono/Droid Sans Mono for Powerline.otf" ~/.local/share/fonts/
if command -v fc-cache @>/dev/null ; then
  echo "Resetting font cache, this may take a moment..."
  fc-cache -f ~/.local/share/fonts
fi

# bash
ln -fs $BASEDIR/aliases ~/.bash_aliases
ln -fs $BASEDIR/bashrc ~/.bashrc

# i3
mkdir -p ~/.config/i3
ln -fs $BASEDIR/i3config ~/.config/i3/config

# i3status
mkdir -p ~/.config/i3status
ln -fs $BASEDIR/i3status.conf ~/.config/i3status/config

# lockscreen
mkdir -p ~/.xlock/
ln -fs $BASEDIR/lock.png ~/.xlock/lock.png

# urxvt
ln -fs $BASEDIR/Xdefaults ~/.Xdefaults
mkdir -p ~/.urxvt/ext/
ln -fs $BASEDIR/urxvt-perls/deprecated/clipboard ~/.urxvt/ext/clipboard

# curl
ln -fs $BASEDIR/curlrc ~/.curlrc

# inputrc
ln -fs $BASEDIR/inputrc ~/.inputrc

# monitor config
ln -fs $BASEDIR/monitors.xml ~/.config/monitors.xml
sudo cp $BASEDIR/monitors.xml /var/lib/gdm/.config/monitors.xml
sudo chown gdm:gdm /var/lib/gdm/.config/monitors.xml

# systemfiles
sudo cp $BASEDIR/system_files/sudoers /etc/sudoers
sudo chown root:root /etc/sudoers
sudo chmod 0440 /etc/sudoers
