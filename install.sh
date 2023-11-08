#!/bin/bash

rm -R /root/smarthome/

#echo Enter provided email token
#read emailtoken

echo Enter Git repository with Token
read varname
$varname smarthome

#sh -c 'cd /root/smarthome && git config user.email $emailtoken'
sh -c 'cd /root/smarthome && bash update-script.sh'
