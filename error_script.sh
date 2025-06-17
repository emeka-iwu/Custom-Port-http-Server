#!/bin/bash

#Change file permision on script file to ensure it is executable
chmod 700 firewall.sh

#Assign current zone to variable ZONE and list all open ports PORTS in that zone

read -p "Enter port number you wish to open: " PORT_NUMBER
read -p "Enter protocol (tcp/udp): " PROTOCOL

ZONE=$(sudo firewall-cmd --get-active-zones | awk '{print $1}' | head -1)
PORTS=$(sudo firewall-cmd --zone=$ZONE --list-ports)

#Check if port 8080 is already open in the current zone
for PORT in "{$PORTS[@]}"; do
    if [[ "$PORT" =~ "$PORT_NUMBER"/"$PROTOCOL" ]]; then
        echo "Port $PORT_NUMBER is already open in $ZONE zone"
        exit 0
    else
        echo "Port $PORT_NUMBER is not open in zone $ZONE, adding it now..."
        sudo firewall-cmd --zone=$ZONE --add-port=$PORT_NUMBER/$PROTOCOL
        sudo firewall-cmd --reload
        echo "Port $PORT_NUMBER is now open in $ZONE zone"
    fi
done


