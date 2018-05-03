# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pofl/Dropbox/configs/fzf/.fzf/bin* ]]; then
  export PATH="$PATH:/home/pofl/Dropbox/configs/fzf/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pofl/Dropbox/configs/fzf/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/pofl/Dropbox/configs/fzf/.fzf/shell/key-bindings.zsh"

