#!/bin/bash
remote=$1
interface=$2
filter="$3"
fifo=$(mktemp -u)

mkfifo $fifo
echo "FIFO $fifo created"

ssh $remote tcpdump -i $interface -U -s0 -w - \'$filter\' > $fifo &
pid=$!
echo "Remote tcpdump launched with PID $pid"

sudo -g sniff wireshark -k -i $fifo

kill $pid
echo "Remote tcpdump killed"

rm $fifo
echo "FIFO deleted"
