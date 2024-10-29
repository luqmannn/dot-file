# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
eval "$(thefuck --alias)"
export LIBVIRT_DEFAULT_URI='qemu:///system'

# Aliases
# Tools
alias yt='yt-dlp'
alias qcow='cd /var/lib/libvirt/images'
alias profile='cd ~/.mozilla/firefox'
alias keygen='ssh-keygen -t ed25519'
alias cls='clear'
alias gcm='git-credential-manager'

# System
alias rcedit='vim ~/.bashrc'
alias rcload='source ~/.bashrc'
alias dnfedit='sudo vim /etc/dnf/dnf.conf'
alias swpp='cat /proc/sys/vm/swappiness'
alias trace='sudo traceroute'

# Dnf
alias update='sudo dnf update'
alias search='dnf search'
alias remove='sudo dnf remove'
alias install='sudo dnf install'
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%d %b %Y %T "

# Systemd / Systemctl
alias status='systemctl status'
alias enable='sudo systemctl enable --now'
alias restart='sudo systemctl restart'

# Kubectl
alias mk='minikube'
alias k='kubectl'
source <(kubectl completion bash)
complete -F __start_kubectl k
