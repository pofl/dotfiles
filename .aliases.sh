alias ls='ls --group-directories-first --hyperlink'
alias ll='ls -lAhF --group-directories-first'
[ -f /usr/bin/exa ] && alias ls="exa --git --group-directories-first" && alias ll="ls -l --header" # Replace ls with exa
[ -f /usr/bin/bat ] && alias cat="bat --tabs=4" # Replace cat with https://github.com/sharkdp/bat
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
alias www='python -m SimpleHTTPServer 8000' # start a web server in any folder you'd like
alias ipe='curl ipinfo.io/ip' # display external IP
alias ipi='ipconfig getifaddr en0' # display internal IP
alias getpass="openssl rand -base64 12" # generate random 12 character password

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gs='git status'

alias weath='curl wttr.in'

# !$ argument of the last command
# !^ first argument of the last command
# !keyword skip Ctrl+R and run last command that contained keyword