#!/bin/sh
# Run this as super user before connecting your HTC to your computer

# To enable ip_forwarding
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward > /dev/null

# To enable NAT for usb0
#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#iptables -A FORWARD -i eth0 -o usb0 -m state --state RELATED,ESTABLISHED -j ACCEPT
#iptables -A FORWARD -i usb0 -o eth0 -j ACCEPT
# DNS forwarding
#iptables -t nat -I PREROUTING -i usb0 -p udp --dport 53 -j DNAT --to 8.8.8.8


sudo iptables -A POSTROUTING -t nat -j MASQUERADE
# a simple dns server
#sudo apt-get install bind9


# This part is only for HTC phones. If you are using other 
# phones, simply comment next lines :)

# To make phone think that we are using HTCSync
# Sending a hex number to port 6000 of phone every 15 sec
while :; do
	date	
	# to find phone's IP
	# I added my hardware address too (grep ...)
	phoneip=$(arp -n | grep usb0 | grep -v incomplete | awk 'BEGIN {FS=" "} {print $1}')
	#while [ -z $phoneip ]; do
		#sleep 15
		#phoneip=$(arp -n | grep usb0 | awk 'BEGIN {FS=" "} {print $1}')
	#done
	# To write the hex number to port 6000 of phone
	#echo -n -e "\x00\x02\x00\x00" | nc $phoneip 6000 > /dev/null
	echo -n -e "\x00\x02\x00\x00" | nc $phoneip 6000 
	echo $phoneip
	sleep 15

	#while [ "$phoneip" != "" ]; do
		#sleep 15
		#phoneip=$(arp -n | grep usb0 | awk 'BEGIN {FS=" "} {print $1}')
	#done
done
