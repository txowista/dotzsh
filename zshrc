#!/bin/zsh


# If I see that zsh takes to much time to load I profile what has been changed,
# # I want to see my shell ready in not more than 1 second
PROFILING=${PROFILING:-false}
if $PROFILING; then
  zmodload zsh/zprof
fi

path=($path
/usr/local/{bin,sbin}
)

[ -d /opt/local/bin ] &&  export PATH=$PATH:/opt/local/bin
[ -d /home/igor/android-ndk-r10e ] &&  export PATH=$PATH:/home/igor/android-ndk-r10e
[ -d /home/igor/android-sdk-linux_r24 ] &&  export PATH=$PATH:/home/igor/android-sdk-linux_r24/platform-tools:/home/igor/android-sdk-linux_r24/tools
[ -d /opt/local/sbin ] &&  export PATH=$PATH:/opt/local/sbin


typeset -U path

COMPLETION_WAITING_DOTS="true"


# change the size of history files
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;

# shell
export CLICOLOR=1
#256 color for vim in tmux
TERM=xterm-256color


# specific for machine configuration 
if [ -f ~/.machinerc  ]; then
  source ~/.machinerc
fi


# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"





# tmux plugin settings
# # this always starts tmux
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_AUTOQUIT=false




# dumb terminal can be a vim dump terminal in that case don't try to load plugins
if [ ! $TERM = dumb  ]; then
  ZGEN_AUTOLOAD_COMPINIT=true
  # If user is root it can have some issues with access to competition files
  if [[ "${USER}" == "root"  ]]; then
    ZGEN_AUTOLOAD_COMPINIT=false
  fi
  # load zgen
  ZGEN_DIR="${HOME}/.dotzsh/zgen"
  source ~/.dotzsh/zgen/zgen.zsh
  # configure zgen
  if ! zgen saved; then

    # zgen will load oh-my-zsh and download it if required
    zgen oh-my-zsh

    # list of plugins from zsh I use
    # see https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/gitfast
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/git-flow
    zgen oh-my-zsh plugins/git-flow-avh
    zgen oh-my-zsh plugins/gitignore
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/dirhistory
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/tmuxinator
#    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/vagrant
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/cp


    # https://github.com/Tarrasch/zsh-autoenv
    #    zgen load Tarrasch/zsh-autoenv
    # https://github.com/zsh-users/zsh-completions
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load chrissicool/zsh-256color 




    # you may also wish to bind it to some keys...
    # zgen load jimmijj/zsh-syntax-highlighting
    #zgen load tarruda/zsh-autosuggestions
    #unset COMPLETION_WAITING_DOTS 
    #to enable tarruda/zsh-autosuggestions
    #    zle-line-init() {
    #          zle autosuggest-start
    #
    #    }
    #    zle -N zle-line-init
    #
    # To accept the autosuggestion (replacing the command line contents), hit End, Alt+F, Ctrl+F, or any other key that moves the cursor to the right


    zgen oh-my-zsh themes/takashiyoshida
    ZSH_THEME= "takashiyoshida"
    zgen save
  fi

fi


# additional configuration for zsh
# Remove the history (fc -l) command from the history list when invoked.
setopt histnostore
# Remove superfluous blanks from each command line being added to the history list.
setopt histreduceblanks
# Do not exit on end-of-file. Require the use of exit or logout instead.
setopt ignoreeof
# Print the exit value of programs with non-zero exit status.
#setopt printexitvalue
#  share history
setopt appendhistory
setopt sharehistory
setopt incappendhistory



# CTRL-T CTRL-R ALT-T with steroids
[ -f ~/.dotzsh/fzf/.fzf.zsh ] && source ~/.dotzsh/fzf/.fzf.zsh

# if profiling was on
if $PROFILING; then
  zprof
fi
# -------------------------------------------------------------------
# # Git aliases
# # -------------------------------------------------------------------
#
alias ga='git add -A'
alias gp='git push'
alias gl='git log'
alias gl='git log'
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias gcm='git commit -m'
alias gcma='git commit -am'
alias gca='git commit -a --verbose'
alias gwip='git commit -am "WIP"'
alias ghist = 'git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=shor'
alias gbr='git branch'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gmg='git merge --no-ff'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
