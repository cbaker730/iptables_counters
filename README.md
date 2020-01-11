# iptables_counters

Create iptables rules that will track the amount of traffic sent to and from a specified IP address. Useful for measuring traffic sent and received during a port scan or vulnerability scan.

  Usage: ./iptables_counters.sh <ip_address> [0|1]

    ./iptables_counters.sh 10.0.0.15 1      Creates rules to track INPUT from and OUTPUT to 10.0.0.15
    ./iptables_counters.sh 10.0.0.15.0      Removes rules created above


    # ./iptables_counters.sh 10.0.0.15 1
    [*] Creating counter rules for 10.0.0.15
    [*] Counters reset. NOTE: Remember to reset counters with: iptables -Z
    [*] Listing rules using: iptables -vn -L
    Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
     pkts bytes target     prot opt in     out     source               destination         
        0     0 ACCEPT     all  --  *      *       10.0.0.15            0.0.0.0/0           

    Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
     pkts bytes target     prot opt in     out     source               destination         

    Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
     pkts bytes target     prot opt in     out     source               destination         
        0     0 ACCEPT     all  --  *      *       0.0.0.0/0            10.0.0.15           
    
    
    
    # ./iptables_counters.sh 10.0.0.1 0
    [*] Removing counter rules for 10.0.0.15
    [*] Listing rules using: iptables -vn -L
    Chain INPUT (policy ACCEPT 26 packets, 3895 bytes)
     pkts bytes target     prot opt in     out     source               destination         

    Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
     pkts bytes target     prot opt in     out     source               destination         

    Chain OUTPUT (policy ACCEPT 1 packets, 97 bytes)
     pkts bytes target     prot opt in     out     source               destination         
