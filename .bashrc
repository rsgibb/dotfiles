#
# ~/.bashrc
#

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  eval "$(<~/.ssh-agent-thing)"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias lazycfg='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'
export PATH=$PATH:~/.bin:~/.local/bin

alias free='free -htw --si'

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

alias vim="nvim"
alias oldvim="\vim"
#alias ls="lsd"
alias ls="exa --icons"

export CM_LAUNCHER=rofi
export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=nvidia
export TERMINAL=/usr/bin/tilix
export EDITOR=/usr/bin/nvim

function sudoedit() {
    SUDO_COMMAND="sudoedit $@" command sudoedit "$@"
}

#function menu()
#{
#    if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
#        wofi --dmenu -p "$1"
#    else
#        rofi -dmenu -P "$1"
#    fi   
#}

# eval "$(starship init bash)"
