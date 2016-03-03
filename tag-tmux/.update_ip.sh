#!/bin/bash

if_conf=~/.tmux_if.conf.local
if_default=eth0
ipinfo_provider=http://ifconfig.ovh

if [ -f $if_conf ]; then
    interface="$(cat $if_conf | tr -d '[[:space:]]')"
else
    interface="$(ip route | grep default | perl -n -e'/ dev ([a-z0-9]+)/ && print $1')"
fi

if [[ -z "${interface// }" ]]; then
    interface=$if_default
fi

ip_local=$(/sbin/ifconfig $interface | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')

ip_out=$(curl -m 5 -s $ipinfo_provider)

echo -n $ip_local > /tmp/ip_local
echo -n $ip_out > /tmp/ip_out

if [ "$ip_local" == "$ip_out" ]; then
    tmux source-file ~/.dotfiles/tag-tmux/.net_direct.conf > /dev/null 2>&1
else
    tmux source-file ~/.dotfiles/tag-tmux/.net_nat.conf > /dev/null 2>&1
fi

