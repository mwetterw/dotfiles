# vim: filetype=sh

calc() {
    echo "$@" | bc -l
}

metartaf() {
    if [ "$#" -lt 1 ]; then
        echo "No station provided"
        return 1
    fi

    for icao in "$@"; do
        echo "--- $icao ---"
        curl -Ss --fail "https://tgftp.nws.noaa.gov/data/observations/metar/stations/${icao}.TXT"
        echo
        curl -Ss --fail "https://tgftp.nws.noaa.gov/data/forecasts/taf/stations/${icao}.TXT"
        echo "------------"
        echo
        echo
    done
}

alias iptl='sudo iptables --line-numbers -vnL'

alias dm='docker-machine'
alias dms='dm ssh'

alias dps='docker ps'
alias dpsa='docker ps -a | head'

alias lsbk='lsblk -f -o "+TRAN,SIZE,MODEL"'

if [ -f ~/.bash_aliases.local ]; then
    source ~/.bash_aliases.local
fi
