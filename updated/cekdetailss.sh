#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
domain1=$(cat /etc/xray/domain)
MYIP=$(wget -qO- ipinfo.io/ip);
NUMBER_OF_CLIENTS=$(grep -E "^### " "/etc/xray/config.json" | sort | uniq | cut -d ' ' -f 2 | wc -l)
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Pilih Nomer Untuk Melihat Konfig"
	echo " Tekan CTRL+C untuk Kembali"
	echo " ==============================="
	echo "     No User    Expired"
	grep -E "^##&# " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | sort | uniq | column -t | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
clear
echo -e ""
echo -e "======-SHADOWSOCKS-======"
echo -e "IP/Host     : $MYIP"
echo -e "Domain      : $domain"
echo -e "Port TLS    : $tls"
echo -e "Password    : $uuid"
echo -e "Method      : aes-128-gcm"
echo -e "========= Path ==========" 
echo -e "=> WS TLS : /xrayssws" 
echo -e "=> GRPC   : ss-grpc" 
echo -e "=> OPOK   : ws://bugcom/xrayssws" 
echo -e "========================="
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "======Import Custom Config From URL ======="
echo -e "Link TLS    : http://${domain}:89/ss-ws-$user.txt"
echo -e "========================="
echo -e "Link GRPC : http://${domain}:89/ss-grpc-$user.txt"
echo -e "========================="
echo -e "Script Mod By andi64"