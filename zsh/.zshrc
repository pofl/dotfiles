# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM=xterm-256color
alias sbt='TERM=xterm-color sbt'
export SHELL=zsh

# OH-MY-ZSH >>>>>>>>>>>>>>>>>>>>>>>

# Path to your oh-my-zsh installation.
export ZSH=/home/pofl/.oh-my-zsh

#ZSH_THEME="ys"
ZSH_THEME="bira"
#ZSH_THEME="fishy"
#ZSH_THEME="frisk"
#ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="bullet-train"

BULLETTRAIN_CONTEXT_DEFAULT_USER="$USER"
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_TIME_BG=cyan
BULLETTRAIN_TIME_FG=black
BULLETTRAIN_DIR_BG=yellow
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_GIT_BG=blue
BULLETTRAIN_EXEC_TIME_BG=green
BULLETTRAIN_DIR_EXTENDED=2 #show complete path
BULLETTRAIN_PROMPT_ORDER=(
	time
	custom
	context
	dir
	git
	cmd_exec_time
	#status
)

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
#    background_jobs - Indicator for background jobs.
#    battery - Current battery status.
#    context - Your username and host, conditionalized based on $USER and SSH status.
#    dir - Your current working directory.
#    dir_writable - Displays a lock icon, if you do not have write permissions on the current folder.
#    disk_usage - Disk usage of your current partition.
#    history - The command number for the current line.
#    host - Your current host name
#    ip - Shows the current IP address.
#    vpn_ip - Shows the current VPN IP address.
#    public_ip - Shows your public IP address.
#    load - Your machine's load averages.
#    os_icon - Display a nice little icon, depending on your operating system.
#    ram - Show free RAM.
#    root_indicator - An indicator if the user has superuser status.
#    status - The return code of the previous command.
#    swap - Prints the current swap size.
#    time - System time.
#    user - Your current username
#    vi_mode- Your prompt's Vi editing mode (NORMAL|INSERT).
#    ssh - Indicates whether or not you are in an SSH session.
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_STATUS_VERBOSE=true
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

export ENHANCD_COMMAND=c
ENHANCD_DOT_SHOW_FULLPATH=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  sbt
  scala

  screen # automatic setting of window titles and status for GNU Screen
  sudo # ESC twice: Puts sudo in front of the current command, or the last one if the command line is empty.
  bgnotify
  wd

  zsh-bash # make the shell more Bash compatible. redefines the source command to act more like Bash does. Enables Bash completions.
  colored-man-pages
  suse
  #chucknorris

  # non-OMZ plugins
  enhancd

  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting # should be last to source
)

source $ZSH/oh-my-zsh.sh

# OH-MY-ZSH <<<<<<<<<<<<<<<<<<<<<<<

# User configuration

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases >>>>>>>>>>>>>>>>>>>>>>>>>
alias su='ZDOTDIR=/home/pofl/ /bin/su --shell=/usr/bin/zsh'
source ~/.aliases.sh
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

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
