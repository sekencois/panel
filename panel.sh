#!/bin/bash

#install
rm -rf panel.sh
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://github.com/sekencois/panel.git
unzip xolpanel/xolpanel.zip
pip3 install -r /project/xolpanel/requirements.txt
pip3 install pillow

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your Subdomain :" domain
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/xolpanel/var.txt
echo -e ADMIN='"'$admin'"' >> /root/xolpanel/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/xolpanel/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Bot Token     : $bottoken"
echo "Id Telegram   : $admin"
echo "Subdomain     : $domain"
echo -e "==============================="
echo "Setting done Please wait 5s"
sleep 5

cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=Simple XolPanel - @xlordeuyy
Documentation=https://t.me/sshxvpn
After=network.target

[Service]
User=root
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
END

systemctl enable xolpanel 
systemctl start xolpanel

clear

echo -e "==============================================="
echo " Installations complete, type /menu on your bot"
echo -e "==============================================="
rm -rf panel.sh
read -n 1 -s -r -p "[ENTER] any key to menu"
menu
