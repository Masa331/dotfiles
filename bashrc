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
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

### Settings
export EDITOR=vim
export TERM=xterm-256color
export PATH=/home/masa331/bin/:$PATH
export PATH=/root/bin/:$PATH
export PATH=/root/.cargo/bin/:$PATH
export RAILS_ENV=development
export NODE_ENV=development

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# automatically switch to Node version specified by .nvmrc vile
# https://github.com/creationix/nvm
find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

cdnvm(){
    cd "$@";
    # nvm_path=$(find-up .nvmrc | tr -d '[:space:]')
    nvm_path=$(pwd)

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        # Add the `v` suffix if it does not exists in the .nvmrc file
        if [[ $nvm_version != v* ]]; then
            nvm_version="v""$nvm_version"
        fi

        # If it is not already installed, install it
        if [[ $(nvm ls "$nvm_version" | tr -d '[:space:]') == "N/A" ]]; then
            nvm install "$nvm_version";
        fi

        if [[ $(nvm current) != "$nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}
alias cd='cdnvm'
eval "$(direnv hook bash)"
