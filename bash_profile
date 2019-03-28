# Adds custom scripts into $PATH
export PATH="$PATH:$HOME/Developer/bin"
# Adds Flutter to $PATH
export PATH="$PATH:$HOME/Developer/flutter/bin"

. colors

# Use nano as default editor lol
export EDITOR=/usr/bin/nano

# export PATH="$HOME/Developer/miniconda3/bin:$PATH"  # commented out by conda initialize
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/neutonfoo/Developer/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/neutonfoo/Developer/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/neutonfoo/Developer/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/neutonfoo/Developer/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Base formats
alias ls="colorls -A --sort-dirs"  # short, multi-line
alias ll="colorls -lA --sort-dirs"  # list, 1 per line
# alias la="colorls -lA --sort-dirs" # list w/ info

alias clear="clear && printf '\e[3J'"
alias bb="billboard"
alias tree="ls --tree"

export PS1="${GREEN}\u@\h${RESET}:${PINK}\W${RESET}\$ "