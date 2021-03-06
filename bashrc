# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo " +"
}

PS1='\[\033[0;32m\]$(hostname) \[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " [\[\033[0;33m\]%s$(parse_git_dirty)\[\033[00m\]]")\$ '

### Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

### Settings
export EDITOR=vim
export TERM=xterm-256color
export PATH=/root/bin/:$PATH
export RAILS_ENV=development
export NODE_ENV=development

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/root/bin/:/root/.nvm/versions/node/v10.9.0/bin:/root/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/usr/bin/core_perl:/root/bin/gyb:/root/.gem/ruby/2.7.0/bin:/bin
