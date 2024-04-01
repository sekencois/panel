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
# Link Installation
link="https://raw.githubusercontent.com/sekencois/panel/main/izin"
clear
#License Validation
license1=$(cat /usr/local/etc/xlordganteng/license)
license2=$(curl -sS ${link}/license | awk '{print $3}' | grep $license1)
if [ $license1 = $license2 ]; then
echo -e "\e[32mLicense Validating Successful\e[0m"
else
clear
echo -e "\e[31mLicense Denied or Invalid\e[0m";
exit 0
fi
#License Expiry
today=$(date -d +1day +%Y-No such file or directory-0)
exp=$(curl -sS ${link}license | grep $license1 | awk '{print $2}')
	if [[ $exp < $today ]]; then
    clear
		Exp2="\033[1;31mLicense has been EXPIRED\033[0m"
		exit 0
    else
    Exp2="\033[1;32mGranted\033[0m"
	fi

date=$(date +"%Y-No such file or directory-20")
# Client Data
client=$(curl -sS ${link}/license | grep $license1 | awk '{print $1}')
cd 
clear
line_atas
echo -e " ${gb}         Download Session             \E[0m"
line_bawah
red "WARNING !!!"
green "Generating download link, Please Wait"
rm -rf /root/results
mkdir /root/results
cp -r /root/shc results/
cd /root
sub=$(</dev/urandom tr -dc a-z0-9 | head -c60)
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
domain=$(cat /etc/xray/domain)
ISP=$(cat /usr/local/etc/xray/org)
Nami=$(curl -sS ${link}license | grep $license1 | awk '{print $1}')
zip -r $client.zip results > /dev/null 2>&1

APIGIT="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"
EMAILGIT='nilabaik9@gmail.com'
USERGIT='sekencois'

git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/memek.git &> /dev/null

directory="/root/memek"
cp /root/shc-$sub.zip /root/memek
cd $directory
git init
git add .
git commit -m "install"
git remote add origin https://github.com/${USERGIT}/memek.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/memek.git &> /dev/null

link="https://raw.githubusercontent.com/sekencois/memek/main/shc-$sub.zip"
green "Successfully"
clear
echo ""
echo -e "Detail Link Download
${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m
  Client : $client
  Link   : $link
  Date   : $date
${CYAN} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
rm -rf /root/results
rm -r /root/$client.zip
echo ""
echo "You can download and extract the results file above"
red "Credit Script by XLORD×CODE"
green "Contact t.me/xlordeuyy"
echo ""
read -n 1 -s -r -p "Press any key to back in encryption menu"
enc