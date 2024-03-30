#!/usr/bin/bash

cat << "EOF"
         -------------------------------------------------------------------
	 |								   |
 	 |		         	h03recon 			   |
	 |			Passive Reconnaissance wrapper		   |
	 -------------------------------------------------------------------

Usage #./h03recon.sh example.com
EOF

target=$1

echo -e "\n\nGatheting linked domains is starting by Amass...\n----------------------------------------"
amass intel  -d $1 -whois > $1-linkedDomain.txt;
cat $1-linkedDomain.txt | sort -u > $1-linkedDomain.txt
cat $1-linkedDomain.txt
echo -e "LinkedDomain is gathered by Amass\n----------------------------------------"
sleep 3


echo -e "\n\nGathering subdomains starting by AssetFinder...\n----------------------------------------"
assetfinder  $1 | sort -u  >  $1-subdomains.txt
cat $1-subdomains.txt
echo -e "\nGathering subdomains finished  by AssetFinder...\n----------------------------------------\n"
sleep 3


echo -e "\nGathering subdomains from online sources continue by xsubfind3r(Add APIs)...\n----------------------------------------"
xsubfind3r -d $1 -s | sort -u  >>  $1-subdomains.txt
cat $1-subdomains.txt
echo -e "\nGathering subdomains finished  by xsubfind3r...\n----------------------------------------\n"
sleep 3

echo -e "Subdomain gathering continue  by Subfinder\n----------------------------------------"
subfinder -d $1 | sort -u >> $1-subdomains.txt
cat $1-subdomains.txt
echo -e "\nSubdomains is gathered by Subfinder\n----------------------------------------"
sleep 3

echo -e "Subdomain gathering  continue  by Subscraper\n----------------------------------------"
sudo subscraper -silent -d $1| sort -u >> $1-subdomains.txt
cat $1-subdomains.txt
echo -e "\nSubdomains is gathered by Subscraper\n----------------------------------------"
sleep 3


echo -e "Subdomain discovery through Permutation, resolve and alternave DNS starting by massdns & Dnsgen \n----------------------------------------"
cat $1-subdomains.txt | dnsgen - | massdns -r resolvers.txt -t A -o S -s 800 -w $1-Subdomains.txt
cat $1-Subdomains.txt | awk '{print $1}' | sed 's/.$//' > $1-Subdomains.txt
echo -e "Subdomain discovery through Permutation, resolve and alternave DNS finished by massdns & Dnsgen \n----------------------------------------"



echo -e "Subdomain enumeration stating by Amass\n----------------------------------------"
amass enum -d $1 | sort -u > $1-enumeration.txt
echo -e "Subdomain enumeration finished by Amass\n----------------------------------------"

