# !$ argument of the last command
# !^ first argument of the last command
# !keyword skip Ctrl+R and run last command that contained keyword

set -o allexport
source ~/.env
set +o allexport

function is_installed() {
  which $1 >/dev/null 2>&1
}

[ -d /home/linuxbrew/.linuxbrew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if is_installed oh-my-posh; then
  eval "$(oh-my-posh init $(oh-my-posh get shell))"
fi

# PATH stuff
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
# export GOROOT=$HOME/.go  # somehow setting this is not necessary anymore
# export PATH="$GOROOT/bin:$PATH"
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
if [ -d "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# podman registry credentials. See `man podman-login`
REGISTRY_AUTH_FILE="$HOME/.config/containers/auth.json"

if [ -d $java_home ]; then
  export PATH=$PATH:$JAVA_HOME/bin
else
  echo "Current JAVA_HOME directory not found"
fi

# WSL stuff
if grep microsoft /proc/version > /dev/null; then
  # obsolete on Win11 due to WSLg # export DISPLAY="$(sed -n 's/nameserver //p' /etc/resolv.conf):0"
  alias idea="~/idea-IU-203.7717.56/bin/idea.sh"
fi

alias ls='ls --group-directories-first --hyperlink'
alias ll='ls -lAhF --group-directories-first'
# Replace ls with exa
is_installed exa && alias ls="exa --git --group-directories-first" && alias ll="ls -l --header" # Replace ls with exa
# Replace cat with bat
is_installed bat && alias cat="bat --tabs=4" # Replace cat with https://github.com/sharkdp/bat
# Midnight Commander wrapper
[ -f /usr/share/mc/mc-wrapper.sh ] && alias mc='. /usr/share/mc/mc-wrapper.sh'

# Default applications
#export BROWSER=/usr/bin/firefox
export EDITOR='/usr/bin/vim'
is_installed micro && export EDITOR=micro
# is_installed subl && export VISUAL=subl
is_installed code && export VISUAL=code
is_installed delta && export GIT_PAGER='delta' || export GIT_PAGER='less --tabs=4 -iXFR'

export LESS="-iMR"
# -i - ignore case when searching (but respect case if search term contains uppercase letters)
# -X - do not clear screen on exit
# -F - exit if text is less than one screen long
# -R - was on by default on my system, something related to colors

alias mkpr='gh pr create --web'
alias setdotenv='export $(grep -v '^#' ./.env | xargs)'

alias www='python3 -m http.server 80' # start a web server in any folder you'd like
alias ipe='curl ipinfo.io/ip' # display external IP
alias ipi='ipconfig getifaddr en0' # display internal IP
alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage"
alias explain_root_dirs="man 7 hier"
alias weather='curl v2.wttr.in'

function launch() {
  nohup $@ > /dev/null &
}
function open() {
  xdg-open "$1" &> /dev/null
}
alias O=open
function git_sync() {
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
