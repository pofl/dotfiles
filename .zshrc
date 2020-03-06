# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# OH-MY-ZSH >>>>>>>>>>>>>>>>>>>>>>>

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # git # Replaced by aliases.sh
  gitfast # faster but less featureful git autocompletion

  screen # automatic setting of window titles and status for GNU Screen
  sudo # ESC twice: Puts sudo in front of the current command, or the last one if the command line is empty.
  bgnotify
  wd
  z
  fzf-z

  colored-man-pages
  #suse
  #chucknorris

  # non-OMZ plugins
  #enhancd

  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting # should be last to source
)

# Only suggest corrections for commands, not arguments
setopt CORRECT
unsetopt CORRECTALL

export ENHANCD_COMMAND=c
ENHANCD_DOT_SHOW_FULLPATH=1

source $ZSH/oh-my-zsh.sh
# OH-MY-ZSH <<<<<<<<<<<<<<<<<<<<<<<

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases >>>>>>>>>>>>>>>>>>>>>>>>>
alias su='ZDOTDIR=/home/pofl/ /bin/su --shell=/usr/bin/zsh'
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

export SHELL=zsh
source ~/.aliases.sh
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
