#!/bin/bash

##nicepass - A simple script to produce a secure yet human memorable password

#take output from dinopass.com (decent but not strong enough) 
DINOPASS=$(curl -s https://www.dinopass.com/password/strong)

#add additional letters and symbols for complexity
RAND=$(openssl rand -base64 3)

#symbols
arr[0]="!"
arr[1]="@"
arr[2]="#"
arr[3]="$"
arr[4]="&"
arr[5]="="
rand=$[$RANDOM % ${#arr[@]}]
RANDSYMBOL=${arr[$rand]}

echo $DINOPASS$RAND$RANDSYMBOL