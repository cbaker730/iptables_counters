# iptables_counters

Create iptables rules that will track the amount of traffic sent to and from a specified IP address.

  Usage: ./iptables_counters.sh <ip_address> [0|1]

    ./iptables_counters.sh 10.0.0.15 1      Creates rules to track INPUT from and OUTPUT to 10.0.0.15
    ./iptables_counters.sh 10.0.0.15.0      Removes rules created above
