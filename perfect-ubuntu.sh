# in progress. not tested;

echo 'Adding repositories...'

sudo apt-add-repository ppa:docky-core/stable -y > /dev/null
sudo add-apt-repository ppa:tualatrix/ppa -y > /dev/null
sudo add-apt-repository ppa:webupd8team/atom -y > /dev/null
sudo add-apt-repository ppa:dhor/myway -y > /dev/null
sudo add-apt-repository ppa:pmjdebruijn/darktable-unstable -y > /dev/null
sudo add-apt-repository ppa:noobslab/themes -y > /dev/null
sudo add-apt-repository ppa:noobslab/macbuntu -y > /dev/null
sudo add-apt-repository ppa:wine/wine-builds -y > /dev/null
sudo add-apt-repository ppa:teejee2008/ppa -y > /dev/null > /dev/null
sudo add-apt-repository ppa:geary-team/releases -y > /dev/null
sudo add-apt-repository ppa:wine/wine-builds -y > /dev/null
sudo add-apt-repository ppa:mhsabbagh/greenproject -y > /dev/null

sudo dpkg --add-architecture amd64

echo 'Updating repositories...'
sudo apt-get update
echo 'Upgrading...'
sudo apt upgrade

echo 'Installing preload...'
sudo apt-get install preload figlet -yqq > /dev/null

echo 'Installing must-have tools...'
sudo apt-get install plank ubuntu-tweak gnome-tweak-tool -yqq
sudo apt install ubuntu-restricted-extras -yqq > /dev/null
sudo apt install libavcodec-extra -yqq > /dev-null
sudo apt-get install synaptic gdebi -yqq > /dev/null

chmod +x ./*.sh

./perfect-dev.sh
./perfect-look.sh
./perfect-apps.sh
./perfect-tweaks.sh

sudo apt-get -fqq install
sudo apt-get -yqq autoremove
sudo apt-get -yqq autoclean
sudo apt-get -yqq clean
