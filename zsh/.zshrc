# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM=xterm-color

# Path to your oh-my-zsh installation.
export ZSH=/home/pofl/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="random"

#ZSH_THEME="ys"
#ZSH_THEME="bira"
#ZSH_THEME="frisk"
ZSH_THEME="xiong-chiamiov-plus"
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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
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
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_STATUS_VERBOSE=false
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=(
  "powerlevel9k/powerlevel9k"
  "bullet-train"
  "agnoster"
  "frisk"
  "xiong-chiamiov-plus"
  "bira"
  "ys"
)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

  suse
  #chucknorris

  # non-OMZ plugins
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting # should be last to source
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
