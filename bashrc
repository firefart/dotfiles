# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

################# SSH-ADD #####################
# http://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
     # add keys if not already added
     /usr/bin/ssh-add -l > /dev/null || /usr/bin/ssh-add;
else
     start_agent;
fi
##############################################

############## powerline-shell ###############

function _update_ps1() {
    PS1="$(~/.powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

##############################################

source ~/.bash_aliases

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

