#!/bin/bash

# Ping to get ART table (in case there were no activity for some time)
/sbin/ping -t 1 255.255.255.255

# Scan network and find UG (U - Up, G - Gateway)
netstat=$(/usr/sbin/netstat -nr | grep UG)

# Get only IP address
gatewayip=$(echo $netstat | cut -d ' ' -f 2)

# Get gateway's MAC address
arpoutput=$(echo "/usr/sbin/arp -an | grep '($gatewayip)'")
arpgateway=$(eval $arpoutput)
gatewaymac=$(echo $arpgateway | cut -d ' ' -f 4)

	# Check if gateway MAC addres is empty
	# => you are offline
	    
	if [ "$gatewaymac" == "" ]
	then
		gatewaymac="0:00:00:00:00:00"
	fi  

# Get timestamp
timestamp=`date +%Y%m%d%H%M`

# Create input string (what will be witten to a file)
input=$timestamp#$gatewaymac

# Write to file
echo $input >> /path/to/txt/file.txt
