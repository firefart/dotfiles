#!/bin/bash

set -eu -o pipefail

BASEDIR=$(pwd)
# remove slash
BASEDIR=${BASEDIR%/}

echo "Basedir: $BASEDIR"

git submodule update --init --recursive

# tmux
if [ -d "${HOME}/.tmux" ]; then
  git -C "${HOME}/.tmux/" pull -q
else
  git clone https://github.com/gpakosz/.tmux.git "${HOME}/.tmux"
fi
ln -s -f "${HOME}/.tmux/.tmux.conf" "${HOME}/.tmux.conf"
cp "${HOME}/.tmux/.tmux.conf.local" "${HOME}/.tmux.conf.local"

# vim
rm -rf "${HOME}/.vim/"
mkdir -p "${HOME}/.vim/"
mkdir -p "${HOME}/.vim/pack/plugins"
ln -fs "$BASEDIR/vim/vimrc" "${HOME}/.vimrc"

# plugins
rm -rf "${HOME}/.vim/bundle"
ln -fs "$BASEDIR/vim/plugins/" "${HOME}/.vim/pack/plugins/start"

# colors
mkdir -p "${HOME}/.vim/colors"
ln -fs "$BASEDIR/vim/colors/molokai/colors/molokai.vim" "${HOME}/.vim/colors/molokai.vim"

# curl
ln -fs "$BASEDIR/curlrc" "${HOME}/.curlrc"

# inputrc
ln -fs "$BASEDIR/inputrc" "${HOME}/.inputrc"

