#!/bin/bash

#nicepass pw generator for linux systems
PASSWORD=$(curl -s https://www.dinopass.com/password/strong)
echo $PASSWORD

#add additional letters and symbols for complexity
