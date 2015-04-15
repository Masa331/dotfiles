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

# handle different history files each host
if [[ `hostname` == dev ]]; then
  export HISTFILE="$HOME/.bash_history_dev"
fi

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[01;34m\]"
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "\033[0;31m⚡"
} 
if [[ $HOSTNAME == termix* ]]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='\[\033[0;32m\]$(hostname) \[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " [\[\033[0;33m\]%s$(parse_git_dirty)\[\033[00m\]]")\$ '
fi

### Sets terminal title to git branch
function git-title {
  local title
  if ! title="`git rev-parse --abbrev-ref HEAD 2>/dev/null`"; then
    # Not a git repository
    title="bash"
  fi
  echo -ne "\033]2;$title\007"
}
export PROMPT_COMMAND="git-title"


### Aliases
alias ls='ls --color=auto'
alias la='ls -al --color=auto'

### Settings
export GREP_OPTIONS='--color=auto'
export export TERM='xterm-256color'
# http://blog.davidchelimsky.net/2011/07/18/stop-typing-bundle-exec/
export PATH=./bin:$PATH
export EDITOR=vim
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
