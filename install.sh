sudo apt-get update
sudo apt-get upgrade
sudo apt-get install wget -y
sudo apt-get install snap -y 
sudo apt install nmap -y
sudo apt install jq -y
sudo apt install golang -y
export GOROOT=/usr/lib/go >> ~/.bashrc
export GOPATH=$HOME/go >> ~/.bashrc
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin >> ~/.bashrc


sudo wget https://github.com/projectdiscovery/subfinder/releases/download/v2.6.5/subfinder_2.6.5_linux_amd64.zip
sudo unzip subfinder_2.6.5_linux_amd64.zip 
sudo rm subfinder_2.6.5_linux_amd64.zip
sudo chmod +x subfinder
sudo cp subfinder /usr/bin/

sudo git clone https://github.com/hueristiq/xsubfind3r.git 
cd xsubfind3r/cmd/xsubfind3r
sudo  go build .
sudo cp xsubfind3r /usr/bin/
cd ../../../

sudo snap install amass

sudo wget https://github.com/AlephNullSK/dnsgen/archive/refs/tags/v1.0.4.zip
sudo unzip v1.0.4.zip
sudo rm v1.0.4.zip
cd dnsgen-1.0.4/
sudo pip install -r requirements.txt
sudo python3  setup.py install
cd ..

sudo https://github.com/infosec-au/altdns.git
cd altdns
sudo pip install -r requirements.txt
sudo python3  setup.py install
cd ..

sudo git clone https://github.com/ffuf/ffuf ; cd ffuf ; go get ; go build

sudo wget https://github.com/projectdiscovery/shuffledns/releases/download/v1.0.9/shuffledns_1.0.9_linux_amd64.zip
sudo unzip shuffledns_1.0.9_linux_amd64.zip
sudo rm shuffledns_1.0.9_linux_amd64.zip
sudo chmod +x shuffledns 
sudo cp shuffledns /usr/bin


sudo wget https://github.com/projectdiscovery/notify/releases/download/v1.0.6/notify_1.0.6_linux_amd64.zip
unzip notify_1.0.6_linux_amd64.zip
sudo rm notify_1.0.6_linux_amd64.zip
sudo chmod +x notify
sudo cp notify /usr/bin

sudo wget https://github.com/tomnomnom/anew/releases/download/v0.1.1/anew-linux-amd64-0.1.1.tgz
sudo tar xvf anew-linux-amd64-0.1.1.tgz
sudo rm anew-linux-amd64-0.1.1.tgz
sudo chmod +x anew
sudo cp anew /usr/bin

sudo wget https://github.com/projectdiscovery/alterx/releases/download/v0.0.4/alterx_0.0.4_linux_amd64.zip
sudo unzip alterx_0.0.4_linux_amd64.zip
sudo rm alterx_0.0.4_linux_amd64.zip
sudo chmod +x alterx
sudo cp alterx /usr/bin




sudo git clone https://github.com/m8sec/subscraper
cd subscraper
pip install -r requirements.txt
pip install taser
pip install ipparser
cd ..

sudo wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz
sudo tar xvf assetfinder-linux-amd64-0.1.1.tgz
sudo rm assetfinder-linux-amd64-0.1.1.tgz
sudo chmod +x assetfinder
sudo cp assetfinder  /usr/bin/

sudo pip install git+https://github.com/sanjai-AK47/Dnsbruter.git



sudo git clone --recursive https://github.com/screetsec/Sudomy.git
cd Sudomy
python3 -m pip install -r requirements.txt
sudo cp sudomy /usr/bin/
cd ..

sudo  git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
cd ..

sudo wget https://github.com/lc/gau/releases/download/v2.2.1/gau_2.2.1_linux_amd64.tar.gz
sudo tar xvf gau_2.2.1_linux_amd64.tar.gz
sudo chmod +x gau
sudo cp gau /usr/bin/
sudo rm gau_2.2.1_linux_amd64.tar.gz
