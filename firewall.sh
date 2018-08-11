#https://unix.stackexchange.com/questions/283801/iptables-forward-traffic-to-vpn-tunnel-if-open
#linux forwarding using firewall iptables
# Masquerade outgoing traffic
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

# Allow return traffic
iptables -A INPUT -i wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i tun0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Forward everything
iptables -A FORWARD -j ACCEPT
