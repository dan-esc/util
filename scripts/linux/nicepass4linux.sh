#!/bin/bash

#nicepass pw generator for linux systems

#Install prerequisties
#If statement, if 'w3m is installed' then skip if not install

password=$(w3m -dump https://www.dinopass.com/password/strong); echo $password
