# vim: filetype=sh

calc() {
    echo "$@" | bc -l
}

alias iptl='sudo iptables --line-numbers -vnL'

alias dm='docker-machine'
alias dms='dm ssh'

alias dps='docker ps'
alias dpsa='docker ps -a | head'


if [ -f ~/.bash_aliases.local ]; then
    source ~/.bash_aliases.local
fi
