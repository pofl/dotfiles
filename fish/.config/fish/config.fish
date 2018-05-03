export SHELL="/usr/bin/fish"

##### nnn setup (show hidden files by default, enable [o]pen in system file manager, enable cd on [Q]uit) #####
export NNN_SHOW_HIDDEN=1
export NNN_DE_FILE_MANAGER=nautilus
export NNN_TMPFILE="/tmp/nnn"
function n --description 'support nnn quit and change directory'
        nnn $argv

        if test -e $NNN_TMPFILE
                . $NNN_TMPFILE
                rm $NNN_TMPFILE
        end
end

#####
function o --description "Open file in default application"
    set -l options 'h/help'
    argparse -n o --min-args=1 $options -- $argv
    or return

    for i in $argv
        bash -c "xdg-open '$i' &> /dev/null"
    end
end

################# aliases ##################
alias su='/bin/su --shell=/usr/bin/fish -p'
alias ls='ls --group-directories-first'
alias ll='ls -lAhF --group-directories-first'
# alias mc='bash -c ". /usr/share/mc/mc-wrapper.sh"'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gf='git fetch'
alias gs='git status'

alias z='sudo zypper'
alias zdup='sudo zypper dup'
alias zin='sudo zypper in'
alias zinfo='zypper info'
alias zrm='sudo zypper rm'
alias zse='zypper se'
alias zlr='zypper lr -u'
