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

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
if [ -d "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# podman registry credentials. See `man podman-login`
export REGISTRY_AUTH_FILE="$HOME/.config/containers/auth.json"

if [ -d $java_home ]; then
  export PATH=$PATH:$JAVA_HOME/bin
else
  echo "Current JAVA_HOME directory not found"
fi

if is_installed mise; then
  eval "$(mise activate $(basename "${SHELL:-bash}"))"
fi

# WSL stuff
if grep microsoft /proc/version > /dev/null; then
  true # noop
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
alias oc='opencode'
alias ow='opencode web'
alias setdotenv='export $(grep -v '^#' ./.env | xargs)'

mkwt() {
  # Ensure we have a branch name
  local branch_name="$1"
  if [[ -z "$branch_name" ]]; then
    echo "Usage: mkwt <branch_name> [start_point]" >&2
    return 1
  fi

  # Ensure we are in a git repository
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: Not a git repository" >&2
    return 1
  fi

  # Use the optional second arg as the new branch's starting point; with origin/main as fallback.
  local base_ref="${2:-origin/main}"

  # Locate the main repo by asking Git for the shared .git directory as an absolute path. This is necessary because the
  # new worktree should be created in the canonical location even if this function is called from inside another
  # worktree.
  local git_common_dir
  git_common_dir=$(git rev-parse --path-format=absolute --git-common-dir) || {
    echo "Error: Could not resolve repository root" >&2
    return 1
  }

  # Strip the trailing /.git to get the main repository checkout path, which is where the .worktrees directory belongs.
  local repo_root="${git_common_dir%/.git}"

  # Build the canonical worktrees directory under the main repository.
  local worktrees_root="${repo_root}.worktrees"
  local wt_path="${worktrees_root}/${branch_name}"

  echo "Creating worktree for branch '$branch_name' at '$wt_path' from '$base_ref'..." >&2
  mkdir --parents "$worktrees_root"

  # Create the worktree without tracking an upstream branch.
  git worktree add --no-track -b "$branch_name" "$wt_path" "$base_ref" >&2
  code "$wt_path"
}

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
