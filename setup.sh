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

# zsh
if [ -d "${HOME}/.oh-my-zsh" ]; then
  git -C "${HOME}/.oh-my-zsh/" pull -q
  git -C "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k" pull -q
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

ln -fs "$BASEDIR/zshrc" "${HOME}/.zshrc"
ln -fs "$BASEDIR/p10k.zsh" "${HOME}/.p10k.zsh"

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
