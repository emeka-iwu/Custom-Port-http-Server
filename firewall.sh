#!/bin/bash
#Assign current zone to variable 
zone=$(sudo firewall-cmd --get-active-zones | awk '{print $1}' | head -1)

#show status of firewall-cmd 
sudo firewall-cmd --list-all --zone=$zone
#add custom port to firewall
sudo firewall-cmd --add-port=8080/tcp --zone=$zone
sudo firewall-cmd --reload
sudo firewall-cmd --list-all --zone=$zone

