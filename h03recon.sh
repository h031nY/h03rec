#!/usr/bin/bash

cat << "EOF"
         -------------------------------------------------------------------
	 |								   |
 	 |		         	h03recon 			   |
	 |			Automated Reconnaissance wrapper		   |
	 -------------------------------------------------------------------

Usage #./h03recon.sh example.com
EOF

target=$1

echo -e "\n\nGatheting linked domains is starting by Amass...\n--------------------------------------------------------------------------------"
amass intel  -d $1 -whois > $1-linkedDomain.txt;
cat $1-linkedDomain.txt | sort -u > $1-linkedDomain.txt
cat $1-linkedDomain.txt
echo -e "LinkedDomain is gathered by Amass\n--------------------------------------------------------------------------------"
sleep 3


echo -e "\n\nGathering subdomains starting by AssetFinder...\n--------------------------------------------------------------------------------"
assetfinder  $1 | sort -u | grep $1 >  $1-subdomains.txt
cat $1-subdomains.txt
echo -e "\nGathering subdomains finished  by AssetFinder...\n--------------------------------------------------------------------------------\n"
sleep 3


echo -e "\nGathering subdomains from online sources continue by xsubfind3r(Add APIs)...\n--------------------------------------------------------------------------------"
xsubfind3r -d $1 -s | sort -u | grep $1 >>  $1-subdomains.txt
cat $1-subdomains.txt
echo -e "\nGathering subdomains finished  by xsubfind3r...\n--------------------------------------------------------------------------------\n"
sleep 3

echo -e "Subdomain gathering continue  by Subfinder\n--------------------------------------------------------------------------------"
subfinder -d $1 | sort -u | grep $1 >> $1-subdomains.txt
cat $1-subdomains.txt
echo -e "\nSubdomains is gathered by Subfinder\n--------------------------------------------------------------------------------"
sleep 3

echo -e "Subdomain gathering  continue  by Subscraper\n--------------------------------------------------------------------------------"
sudo subscraper -silent -d $1 | sort -u | grep $1 >> $1-subdomains.txt
cat $1-Subdomains.txt
echo -e "\nSubdomains is gathered by Subscraper\n--------------------------------------------------------------------------------"
sleep 3


echo -e "Subdomain discovery through Permutation, resolve and alternative DNS starting by massdns & Dnsgen \n--------------------------------------------------------------------------------"
cat $1-subdomains.txt | dnsgen - | massdns -r resolvers.txt -t A -o S -s 800 -w $1-resolved-Subdomains.txt
cat $1-resolved-Subdomains.txt | awk '{print $1}' | sed 's/.$//' | sort -u > $1-Final-Subdomains.txt
cd ..
echo -e "Subdomain discovery through Permutation, resolve and alternave DNS finished by massdns & Dnsgen \n--------------------------------------------------------------------------------"
sleep 3

echo -e "\nDiscovering real ips behind CDN & http_resolve \n--------------------------------------------------------------------------------"
cut-cdn -i $1-subdomains.txt -q | sort -u > $1-ip_behind_cdn.txt
cat $1-ip_behind_cdn.txt
echo -e "\n The real ips based on http & https\n--------------------------------------------------------------------------------\n"
cat $1-ip_behind_cdn.txt | httprobe > $1-http-real_ip.txt
cat $1-http-real_ip.txt
echo -e "\nReal ips behind CDN discovered \n--------------------------------------------------------------------------------"
sleep 3


echo -e "Subdomain enumeration stating by Amass\n--------------------------------------------------------------------------------"
amass enum -d $1 | sort -u > $1-enumeration.txt
echo -e "Subdomain enumeration finished by Amass\n--------------------------------------------------------------------------------"
