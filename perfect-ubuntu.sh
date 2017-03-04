# in progress. not tested;

echo 'Adding repositories...'

#sudo apt-add-repository ppa:docky-core/stable -y
#sudo add-apt-repository ppa:tualatrix/ppa -y
sudo add-apt-repository ppa:webupd8team/atom -y
sudo add-apt-repository ppa:dhor/myway -y
sudo add-apt-repository ppa:pmjdebruijn/darktable-unstable -y
sudo add-apt-repository ppa:noobslab/themes -y
sudo add-apt-repository ppa:noobslab/macbuntu -y
sudo add-apt-repository ppa:wine/wine-builds -y
sudo add-apt-repository ppa:teejee2008/ppa -y
sudo add-apt-repository ppa:geary-team/releases -y
sudo add-apt-repository ppa:wine/wine-builds -y
sudo add-apt-repository ppa:mhsabbagh/greenproject -y

sudo dpkg --add-architecture amd64

echo 'Updating repositories...'
sudo apt-get update
echo 'Upgrading...'
sudo apt upgrade

echo 'Installing preload...'
sudo apt-get install preload figlet -yqq

echo 'Installing must-have tools...'
sudo apt-get install plank ubuntu-tweak gnome-tweak-tool -yqq
sudo apt install ubuntu-restricted-extras -yqq
sudo apt install libavcodec-extra -yqq > /dev-null
sudo apt-get install synaptic gdebi -yqq

chmod +x ./*.sh

#sh ./perfect-dev.sh
#sh ./perfect-look.sh
#sh ./perfect-apps.sh
#sh ./perfect-tweaks.sh

sudo apt-get -fqq install
sudo apt-get -yqq autoremove
sudo apt-get -yqq autoclean
sudo apt-get -yqq clean
