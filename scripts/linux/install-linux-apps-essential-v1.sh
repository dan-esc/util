#Install linux essentials dan-esc v1.0

title="Install linux apps - dan-esc v1.0 - 2020"

echo $title

sleep 1s #sleep 1 second

#colour code cyan 
tput setaf 6; echo "The aim of this script is to install useful apps after deploying a new image of Ubuntu - v1.0 dan-esc 2020"

sleep 3s #sleep 3 seconds

#colour code magenta
tput setaf 4; echo "
###Apps being installed###
snap    vs-code       git
chromium-browser    kicad 
libreoffice       gparted
caffeine
vim     openssl    alpine
imagemagick gnome-tweaks
xclip   snapd   blueman
wget    dropbox
teamviewer     virtualbox
htop    vlc        docker
Visual Studio Code nmap
########################"

#colour code cyan
tput setaf 6; 
printf "Press enter to continue or press ctrl c to quit if terms are unacceptable - have a nice day ^_^"
read _

#Add repo

#Install apps
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y snap git chromium-browser kicad libreoffice gparted 
caffeine vim openssl alpine imagemagick gnome-tweaks
xclip snapd blueman wget virtualbox virtualbox—ext–pack software–properties–common htop vlc  nmap

#Snap apps
echo "Install Visual Studio Code"
sudo snap install -y --classic code

#Install docker################################################################

echo "Install Docker"

#Install preq

    sudo apt-get install -y 
    apt-transport-https 
    ca-certificates 
    curl 
    gnupg-agent 
    software-properties-common

#Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Verify that you now have the key with the fingerprint
sudo apt-key fingerprint 0EBFCD88

#Add repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#Install docker engine
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#colour code magenta
tput setaf 4;

echo "Docker has now been installed, you will need to install an engine of
your choice later!"

sleep 3s #sleep 3 seconds

#colour code cyan
tput setaf 6;
###############################################################################

#Themes
echo "Install colourful terminal theme 'dracula'"
sudo apt-get install -y dconf-cli 
sudo git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
sudo ./install.sh --scheme=Dracula --profile Default --install-dircolors

 sleep 2s #sleep 2 seconds

#colour code cyan
tput setaf 6;

#Dropbox headless manual install
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

~/.dropbox-dist/dropboxd

#Teamviewer manual install
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

sudo apt install -y ./teamviewer_amd64.deb 

#colour code magenta
tput setaf 4;
echo "Teamviewer and Dropbox installed"

sleep 2s #sleep 2 seconds

echo "Now please set your alias'
Example
sudo vim ~/.bashrc

alias install=sudo apt-get install -y
alias update=sudo apt update && sudo apt upgrade -y
alias vim=sudo vim"

sleep 3s #sleep 3 seconds

echo "Have fun! Always learn ^_^"

sleep 3s #sleep 3 seconds
