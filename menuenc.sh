#!/bin/bash
# Valid Script
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
g="\e[36m"
gb='\033[0;37m'
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
echo -e " ${CYAN}┌─────────────────────────────────────•${p}"
}
function line_tengh() {
echo -e " ${CYAN}└─────────────────────────────────────•${p}"
}
clear
# Link Installation
link="https://github.com/sekencois/panel/main/"

# License Validation
license1=$(cat /usr/local/etc/xlordganteng/license)
license2=$(curl -sS ${link}/license | awk '{print $3}' | grep $license1)
if [ $license1 = $license2 ]; then
echo -e "\e[32mLicense Validating Successfull\e[0m";
else
clear
echo -e "\e[31mLicense Invalid\e[0m";
fi
sleep 2
# Expired License
today=$(date -d +1day +%Y-%m-%d)
exp=$(curl -sS ${link}license | grep $license1 | awk '{print $2}')
	if [[ $exp < $today ]]; then
		Exp2="\033[1;31mExpired\033[0m"
    else
    Exp2=$(curl -sS ${link}license | grep $license1 | awk '{print $2}')
	fi
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
dayexp=$(( (d1 - d2) / 86400 ))
# Status License
exp=$(curl -sS ${link}license | grep $license1 | awk '{print $2}')
	if [[ $exp < $today ]]; then
		statuslcns="\033[1;31mINVALID\033[0m"
    else
    statuslcns="\033[1;32mACTIVE\033[0m"
	fi
# Client Data
Name=$(curl -sS ${link}license | grep $license1 | awk '{print $1}')
echo "$Name" > /usr/local/etc/xlordganteng/client
client=$(cat /usr/local/etc/xlordganteng/client)

clear
line_atas
echo -e "${CYAN}  ${NC}${g}       .::.${NC}${p} PANEL ENC SHC ${g}.::.  $NC"
line_bawah
line_atas
echo -e " ${g}│  ${gb}[01] • $NC ${g}START ENC"
echo -e " ${g}│  ${gb}[02] • $NC ${g}DONWLOAD HASIL"
echo -e " ${g}│  ${gb}[03] • $NC ${g}MENU LICENSI"
line_bawah
line_atas
echo -e " ${g}│  ${gb}[x]• ${b} Go Back To Menu"
line_bawah
line_tengah
echo -e " ${g}│   ${gb}Client Name      : $client"
echo -e " ${g}│   ${gb}License Status   : $statuslcns"
echo -e " ${g}│   ${gb}Expired          : ${yell}$dayexp Day"
line_tengh
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; executor ;;
2) clear ; downloadenc ;;
3) clear ; lcnsmenu ;;
0) clear ; menu ;;
*) echo "salah ketik kontol" ; sleep 1 ; enc ;;
esac
