# .bashrc

bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
# Source sensible-bash
[ -f ~/.sensible.bash ] && source ~/.sensible.bash
# Replace ls with exa
[ -f /usr/bin/exa ] && alias ls="exa" && alias ll="exa -l" # alias ll='ls -lAsh'
# Midnight Commander wrapper
[ -f /usr/bin/mc ] && alias mc='. /usr/share/mc/mc-wrapper.sh'

function launch () {
  nohup $@ > /dev/null &
}
function o () {
  xdg-open "$1" &> /dev/null
}
function git-sync () {
  git add .
  git commit -a -m "sync"
  git pull --verbose --rebase origin master
  git push --verbose origin master
}

# Default applications
#export BROWSER=/usr/bin/firefox
#export EDITOR=/usr/bin/vim
#export VISUAL=/usr/bin/subl

export LESS="-iMR"
# -i - ignore case when searching (but respect case if search term contains uppercase letters)
# -X - do not clear screen on exit
# -F - exit if text is less then one screen long
# -R - was on by default on my system, something related to colors

# Colored man output
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

# FZF CONFIG >>>>>>>>>>>>>>>>>>>>>>
#export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g "" 2> /dev/null'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# NNN CONFIG >>>>>>>>>>>>>>>>>>>>>>
export NNN_SHOW_HIDDEN=1
export NNN_DE_FILE_MANAGER=nautilus
export NNN_TMPFILE="/tmp/nnn"
n() {
  if [ -n "$1" ]; then
    nnn "$1"
  else
    nnn
  fi

  if [ -f $NNN_TMPFILE ]; then
    . $NNN_TMPFILE
    rm $NNN_TMPFILE
  fi
}
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# extract any archive
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# Aliases >>>>>>>>>>>>>>>>>>>>>>>>>
alias su='/bin/su --command=bash\ --rcfile=/home/pofl/.bashrc'
source ~/.aliases.sh
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# BASH_IT CONFIG >>>>>>>>>>>>>>>>>>

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
#export BASH_IT_THEME='zork'
#export BASH_IT_THEME='powerline'
#export BASH_IT_THEME='powerline-multiline'
#export BASH_IT_THEME='powerline-minimal'
export BASH_IT_THEME='minimal'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
[ -f $BASH_IT/bash_it.sh ] && source $BASH_IT/bash_it.sh
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

