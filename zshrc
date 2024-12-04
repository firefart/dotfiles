# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  docker
  docker-compose
  golang
  zsh-syntax-highlighting
  zsh-autosuggestions
  ssh-agent
)

source $ZSH/oh-my-zsh.sh

# auto updates
zstyle ':omz:update' mode auto

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## CUSTOM STUFF ##

# Press CTRL+V followed by the key to see the code
# Keypad
# 0 . Enter
# bindkey -s "^[Op" "0"
# bindkey -s "^[On" "."
# bindkey -s "^[OM" "^M"
# # 1 2 3
# bindkey -s "^[Oq" "1"
# bindkey -s "^[Or" "2"
# bindkey -s "^[Os" "3"
# # 4 5 6
# bindkey -s "^[Ot" "4"
# bindkey -s "^[Ou" "5"
# bindkey -s "^[Ov" "6"
# # 7 8 9
# bindkey -s "^[Ow" "7"
# bindkey -s "^[Ox" "8"
# bindkey -s "^[Oy" "9"
# # / * - +
# bindkey -s "^[OQ" "/"
# bindkey -s "^[OR" "*"
# bindkey -s "^[OS" "-"
# bindkey -s "^[Ol" "+"

export EDITOR='nvim'
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin/:$HOME/.cargo/bin:/opt/neovim/bin
export ANSIBLE_NOCOWS=1
export GOPATH=$HOME/go
export DOTNET_CLI_TELEMETRY_OPTOUT=1

alias vim="nvim"
alias vi="nvim"

if [ -x "$(command -v exa)" ]; then
    alias ls="exa --icons"
    alias ll='exa -lhaF --icons'
fi

[ -f ~/.firefart.zshconfig ] && source ~/.firefart.zshconfig

if [ -z "$TMUX" ] && [[ "$SSH_CONNECTION" != "" ]]; then
      tmux attach -t default || tmux new -s default
fi
