alias ls='ls --group-directories-first --hyperlink'
alias ll='ls -lAhF --group-directories-first'
# Replace ls with exa
[ -f /usr/bin/exa ] && alias ls="exa --git --group-directories-first" && alias ll="ls -l --header" # Replace ls with exa
# Replace cat with bat
[ -f /usr/bin/bat ] && alias cat="bat --tabs=4" # Replace cat with https://github.com/sharkdp/bat
# Midnight Commander wrapper
[ -f /usr/bin/mc ] && alias mc='. /usr/share/mc/mc-wrapper.sh'

test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
alias www='python3 -m http.server 80' # start a web server in any folder you'd like
alias ipe='curl ipinfo.io/ip' # display external IP
alias ipi='ipconfig getifaddr en0' # display internal IP
alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage"
alias explain_root_dirs="man 7 hier"
alias weath='curl wttr.in'

# Default applications
#export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/vim
if [ -f /usr/bin/subl ] export VISUAL=/usr/bin/subl
delta --version && export GIT_PAGER=delta

export LESS="-iMR"
# -i - ignore case when searching (but respect case if search term contains uppercase letters)
# -X - do not clear screen on exit
# -F - exit if text is less than one screen long
# -R - was on by default on my system, something related to colors

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

alias sbt='TERM=xterm-color sbt'

function launch () {
  nohup $@ > /dev/null &
}
function open () {
  xdg-open "$1" &> /dev/null
}
alias O=open
function git-sync () {
  git add .
  git commit -a -m "sync"
  git pull --verbose --rebase origin master
  git push --verbose origin master
}
function g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

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

# !$ argument of the last command
# !^ first argument of the last command
# !keyword skip Ctrl+R and run last command that contained keyword

