#!/bin/bash


ip=$1
toggle=$2

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <ip_address> [0|1]"
    exit 1
fi

if [ "$toggle" = 1 ]; then
    echo "[*] Creating counter rules for $ip"
    iptables -I INPUT 1 -s $ip -j ACCEPT
    iptables -I OUTPUT 1 -d $ip -j ACCEPT
    iptables -Z
    echo "[*] Counters reset. NOTE: Remember to reset counters with: iptables -Z"

elif [ "$toggle" = 0 ]; then
    echo "[*] Removing counter rules for $ip"
    iptables -D INPUT -s $ip -j ACCEPT
    iptables -D OUTPUT -d $ip -j ACCEPT

else
    echo "[*] Error! Usage: $0 <ip_address> [0|1]"
    exit 1

fi


echo "[*] Listing rules using: iptables -vn -L"
#iptables --list
iptables -vn -L
