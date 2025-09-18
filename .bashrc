# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Auto-detect terminal size
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set a fancy prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# Set terminal title
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# Enable color support for ls, grep, etc.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Handy ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Chrome alias (for opening files from WSL)
chrome() {
  "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe" "$(wslpath -w "$1")"
}

# Neovim & editor setup
export PATH="$PATH:/opt/nvim/bin:/opt/nvim-linux-x86_64/bin"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="chrome"

# VS Code (WSL) path
export PATH="$PATH:/mnt/c/Users/aniru/AppData/Local/Programs/Microsoft VS Code/bin"

# NVM support
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Load envman if available
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dyno/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dyno/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dyno/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dyno/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# --- Personal Aliases ---
alias anime='cd "/mnt/d/Videos/Anime"'
alias coding='cd "/mnt/d/programming"'

# --- WINDOWS MPV SETUP ---
export PATH=$HOME/bin:$PATH

# Set consistent colors for ls
eval "$(dircolors -b)"
export LS_COLORS="$LS_COLORS:ow=1;34:"  # This fixes the "other-writable" directory colors
