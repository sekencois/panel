#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
g="\033[1;93m"
gb="\e[92;1m"
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
function line_atas(){
echo -e " ${CYAN}┌─────────────────────────────────────┐${p}"
}
function line_bawah() {
echo -e " ${CYAN}└─────────────────────────────────────┘${p}"
}
function line_tengah() {
echo -e "   ${CYAN}────────────────────────────────────────${p}"
}
clear

# Link Instalasi
link="https://raw.githubusercontent.com/sekencois/panel/main/izin"
mkdir /usr/local/etc/xlordganteng
apt install curl -y
clear
# License
line_atas
echo -e "  ${gb}       Validating License            \E[0m"
line_bawah
read -rp "Input the license : " -e lcns
    if [ -z $lcns ]; then
        echo -e "Empty License, Aborting Installations"
        exit 0
    else
        echo -e "License Added"
        echo "$lcns" > /usr/local/etc/xlordganteng/license
fi
# Validating License
license1=$(cat /usr/local/etc/xlordganteng/license)
license2=$(curl -sS ${link}/license | awk '{print $3}' | grep $license1)
if [ $license1 = $license2 ]; then
echo -e "\e[32mLicense Validating Successful\e[0m"
else
echo -e "\e[31mLicense Denied\e[0m";
exit 0
fi
# Client Data
Name=$(curl -sS ${link}/license | grep $license1 | awk '{print $1}')
echo "$Name" > /usr/local/etc/xlordganteng/client
client=$(cat /usr/local/etc/xlordganteng/client)
clear
line_atas
echo -e "  ${gb}       Installation Started          \E[0m"
line_bawah
echo -e "\e[32mUpdating Repo\e[0m"
        apt update && apt upgrade -y
        apt get-update
        apt install figlet -y
        apt install lolcat -y
        apt install curl -y
clear
echo -e "\e[32mDownloading Feature\e[0m"
      cd /root
      mkdir shc
      cd shc
      sudo apt install shc -y
      sudo apt install gcc
clear
echo -e "\e[32mDownloading Menu\e[0m"
cd /usr/bin
wget -q -O encryptall "https://raw.githubusercontent.com/sekencois/panel/main/shco.sh"
wget -q -O enc "https://raw.githubusercontent.com/sekencois/panel/main/menuenc.sh"
wget -q -O downloadenc "https://raw.githubusercontent.com/sekencois/panel/main/downloadenc.sh"
wget -q -O executor "https://raw.githubusercontent.com/sekencois/panel/main/executor.sh"
wget -q -O lcnsmenu "https://raw.githubusercontent.com/sekencois/panel/main/lcnsmenu.sh"
sleep 1
clear
chmod +x encryptall
chmod +x enc
chmod +x downloadenc
chmod +x executor
chmod +x lcnsmenu
sleep 1
clear
echo -e "Done"
cd /root
rm install.sh
echo -e "\e[32mInstallation Successful\e[0m"
echo -e "Type [enc] to access Encryption menu"
read -n 1 -s -r -p "Press any key to access encryption menu"
enc