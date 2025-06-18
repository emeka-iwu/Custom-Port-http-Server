#!/bin/bash

# Assign input values to port number.
while true; do
    read -p "Enter port number you wish to open: " PORT_NUMBER
    if [[ "$PORT_NUMBER" =~ ^[0-9]+$ && "$PORT_NUMBER" -gt 0 && "$PORT_NUMBER" -lt 65535 ]]; then
        break
    else
        echo "Invalid Port. Enter a valid port number"
    fi
done

# Assign input values to protocol.

while true; do
    read -p "Enter protocol (tcp/udp): " PROTOCOL
    if [[ "$PROTOCOL" == "udp" || "$PROTOCOL" == "tcp" ]]; then
        break
    else
        echo "enter a valid  protocol (tcp/udp)"
    fi
done

#Assign current zone to variable ZONE and list all open ports PORTS in that zone

ZONE=$(sudo firewall-cmd --get-active-zones | awk '{print $1}' | head -1)
PORTS=$(sudo firewall-cmd --zone=$ZONE --list-ports)

#Check if port is already open in the current zone, else open it
if [[ "$PORTS" =~ $PORT_NUMBER/$PROTOCOL ]]; then
    echo "Port $PORT_NUMBER is already open in $ZONE zone"
    sudo firewall-cmd --list-ports --zone=$ZONE
    exit 0
else
    echo "Port $PORT_NUMBER is currently not open in zone $ZONE, adding it now..."
    sudo firewall-cmd --zone=$ZONE --add-port=$PORT_NUMBER/$PROTOCOL --permanent
    sudo firewall-cmd --reload
    echo "Port $PORT_NUMBER/$PROTOCOL is now open in $ZONE zone"
fi


