# .bashrc

bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'

# Source global definitions
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
# Source sensible-bash
[ -f ~/.sensible.bash ] && source ~/.sensible.bash


# Recurse .bashrc.d
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# FZF CONFIG >>>>>>>>>>>>>>>>>>>>>>
#export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g "" 2> /dev/null'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# Aliases >>>>>>>>>>>>>>>>>>>>>>>>>
alias su='/bin/su --command=bash\ --rcfile=/home/pofl/.bashrc'
source ~/.aliases.sh

if is_installed kubectl; then
  source <(kubectl completion bash)
fi
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# BASH_IT CONFIG >>>>>>>>>>>>>>>>>>

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='iterate'
#export BASH_IT_THEME='powerline'
#export BASH_IT_THEME='powerline-multiline'
#export BASH_IT_THEME='powerline-minimal'
#export BASH_IT_THEME='minimal'

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
