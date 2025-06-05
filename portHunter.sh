#!/bin/bash

#Colores
redColour="\e[31m"
greenColour="\e[32m"
yellowColour="\e[33m"
blueColour="\e[34m"
grayColour="\e[90m"
defaultColour="\e[0m"



tmp_ports_file="tmp_ports.txt"
tmp_services_scan="tmp_services_scripts_xml.xml"



#Ctrl + C control
trap ctrl_c INT

function ctrl_c(){

	echo -e "${redColour}[!] Ctrl_C detected, leaving ... ${defaultColour}"; sleep 1
	rm $tmp_ports_file 2>/dev/null; rm $tmp_services_scan 2>/dev/null
	exit 1


}


#Dependencies

if ! which figlet &>/dev/null;then
	
	echo -e "${yellowColour}[+]${defaultColour}${blueColour} Figlet${defaultColour}${grayColour} is not installed, installing...${defaultColour}"
	sudo apt install figlet -y &>/dev/null
fi

if ! command -v lolcat &>/dev/null; then
	echo -e "${yellowColour}[+]${defaultColour}${blueColour} Lolcat${defaultColour}${grayColour} is not installed, installing...${defaultColour}"
	sudo apt install lolcat -y &>/dev/null
fi

if ! which xsltproc &>/dev/null; then
	echo -e "${yellowColour}[+]${defaultColour}${blueColour} Xsltproc${defaultColour}${grayColour} is not installed, installing...${defaultColour}"
	sudo apt install xsltproc -y &>/dev/null
fi


if ! which xclip &>/dev/null; then
	echo -e "${yellowColour}[+]${defaultColour}${blueColour} Xclip${defaultColour}${grayColour} is not installed, installing...${defaultColour}"
	sudo apt install xclip -y &>/dev/null
fi


if ! which nmap &>/dev/null; then
	echo -e "${yellowColour}[+]${defaultColour}${blueColour} Nmap${defaultColour}${grayColour} is not installed, installing...${defaultColour}"
	sudo apt install nmap -y &>/dev/null
fi


if [ -z $1 ]
then
	echo -e "${redColour}[!]${defaultColour} Usage $0 {IP}${grayColour}${defaultColour}"
else
	
	target=$1


	figlet -f slant PortHunter | lolcat
	echo -e "\n${yellowColour}[+]${defaultColour}${blueColour} Scanning ports for${defaultColour}${greenColour} $target...${defaultColour}\n"



	#Copy the ports to the clipboard
	nmap -p- --open -Pn -n --min-rate 5000 $target -vvv -oG $tmp_ports_file | grep 'Discovered open port '
	ports=$(cat $tmp_ports_file | grep -oP '\d{1,5}/open' | awk -F'/' '{print $1}' | paste -sd ',')
	echo $ports | xclip -sel clipboard && rm $tmp_ports_file
	



	#Perform a detailed scan of the ports
	echo -e "\n${yellowColour}[+]${defaultColour}${blueColour} Scanning Services and Versions for${defaultColour}${greenColour} $target...${defaultColour}\n"
	nmap -sCV -p"$ports" -oX $tmp_services_scan $target -Pn &>/dev/null

	echo -e "\n${greenColour}[+]${defaultColour}${blueColour} Done!${defaultColour}\n"
	echo -e "\n${greenColour}[+]${defaultColour}${blueColour} Opening Firefox...${defaultColour}\n"; sleep 2




	#Create the index.html file by converting the xml using xsltproc
	xsltproc $tmp_services_scan -o 'index.html'




	#Start the server to see the results with firefox
	python3 -m http.server 5555 &>/dev/null &
	python_server=$!; sleep 2
	/usr/bin/firefox http://127.0.0.1:5555/index.html &>/dev/null &
	sleep 15; kill $python_server &>/dev/null
	rm $tmp_services_scan


fi
