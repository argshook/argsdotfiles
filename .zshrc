PATH=$(getconf PATH)
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/go/bin:$HOME/.argsdotfiles/bin:$HOME/.local/bin:$HOME/.rvm/bin:$HOME/.cargo/bin:$HOME/.yarn/bin
export VISUAL="nvim"
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_ALT_C_COMMAND='rg'
export FZF_CTRL_T_COMMAND='rg --files --hidden --no-ignore --iglob !node_modules'
export FZF_TMUX=1
export MANPAGER="nvim +Man!"

if [[ $OSTYPE == 'darwin'* ]]; then
  export ZETTEL="/Volumes/stuff"
else
  export ZETTEL=$HOME/zettel
fi


export PASSWORD_STORE_DIR="$ZETTEL/pass"
export JAVA_HOME=`which java`
export BROWSER=`which qutebrowser`

source ~/.argsdotmodules/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle djui/alias-tips
antigen bundle taskwarrior
antigen bundle tmuxinator
antigen bundle docker
antigen bundle docker-compose
antigen apply

# press V in normal mode to edit command in nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

IS_SSH_AGENT_RUNNING=`ps ax|grep -c "[s]sh-agent"`
if (( $IS_SSH_AGENT_RUNNING  == 0 )) then
  touch ~/.ssh-env
  ssh-agent | head -2 > ~/.ssh-env
  source ~/.ssh-env
  ssh-add
else
  source ~/.ssh-env
fi

# utility function to avoid errors
source_if_exists () {
  if [[ -f $1 ]]; then
    source $1
  fi
}

source_if_exists ~/.argsdotfiles/zsh/theme.zsh-theme
source_if_exists ~/.argsdotfiles/zsh/taskwarrior.zsh
source_if_exists ~/.rvm/scripts/rvm

if [[ $OSTYPE == 'darwin'* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# fasd
eval "$(fasd --init auto)"

# vi keys bindings
bindkey -v
bindkey '^ ' autosuggest-accept

# fzf
source_if_exists ~/.argsdotfiles/zsh/fzf

# history
setopt INC_APPEND_HISTORY # add commands immediatelly, not only after leaving shell
setopt EXTENDED_HISTORY # add timestamps to history file entries
setopt HIST_IGNORE_ALL_DUPS # do not write duplicates to history
setopt HIST_IGNORE_SPACE
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILE=~/.zhistory
export HISTTIMEFORMAT="[%F %T] "
export HISTIGNORE="in:zet:t:pass"
export GH_PAGER=cat

alias qr="qrencode --type utf8"
alias kurwa="killall -9"
alias npmnx="_npmnx"
alias q="exit"
alias r="ranger"
alias rn="ranger node_modules"
alias n="nvim"
alias nu="nvim -u NONE"

# git
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gpl="git pull --rebase"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias arch="uname -m"

alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gl5="gl -5"
alias glweek="git shortlog -s --since="last week""
alias gp="git push"
alias gpo="git push origin"

alias gisnew="git remote update && gs"
alias gitlarge='~/.argsdotfiles/zsh/git-largest-files.py'

# tmux
alias tmuxa="tmux attach-session -t" # attach to session
alias tmuxn="tmux new-session -s" # create new session
alias tmuxk="tmux kill-session -t" # kill session
alias tmuxl="tmux ls" # list all sessions

_npmnx () {
  find . \( -name node_modules \) -exec echo "Removing {}" \; -exec rm -rf {} \; 2>/dev/null
}

_npm_clone () {
  # depends on ~/.argsdotfiles/bin/clone
  clone `npm view $1 repository.url`
}
alias clone-npm="_npm_clone"

_kill_port () {
  kill -9 $(lsof -ti :$1)
}
alias killport="_kill_port"

# misc
alias grep="grep --color=auto"
alias cl="clear"
alias browse="xargs qutebrowser" # usage: echo google.com | browse

kubectl () {
  command kubectl $*
  if [[ -z $KUBECTL_COMPLETE ]]
  then
    source <(command kubectl completion zsh)
    KUBECTL_COMPLETE=1 
  fi
}

# fix for git log not displaying special characters correctly
export LC_ALL=en_US.UTF-8

# do not share command history between terminal instances
unsetopt SHARE_HISTORY

# 10ms for key sequences
KEYTIMEOUT=1

# required by gpg-agent
GPG_TTY=$(tty)
export GPG_TTY
unset zle_bracketed_paste

unsetopt BEEP

source_if_exists ~/.private.zshrc

# fnm
eval "`fnm env`"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$HOME/.poetry/bin:$PATH"

