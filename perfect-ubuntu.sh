# in progress. not tested;

sudo apt-add-repository ppa:docky-core/stable -y
sudo add-apt-repository ppa:tualatrix/ppa -y
sudo add-apt-repository ppa:webupd8team/atom -y
sudo add-apt-repository ppa:dhor/myway -y
sudo add-apt-repository ppa:pmjdebruijn/darktable-unstable -y
# sudo add-apt-repository ppa:kazam-team/stable-series -y
sudo add-apt-repository ppa:noobslab/themes -y
sudo add-apt-repository ppa:noobslab/macbuntu -y
sudo add-apt-repository ppa:wine/wine-builds -y
sudo add-apt-repository ppa:teejee2008/ppa -y
sudo add-apt-repository ppa:geary-team/releases -y
# sudo add-apt-repository ppa:fossfreedom/rhythmbox -y
sudo apt-get update

sudo dpkg --add-architecture amd64

sudo apt-get update

sudo apt install rawtherapee -y
sudo apt-get install mypaint -y
sudo apt-get install darktable -y
# sudo apt-get install kazam -y
sudo apt-get install flatabulous-theme -y
sudo apt-get install gnome-tweak-tool indicator-multiload -y
sudo apt-get install aptik -y
# sudo apt-get install rhythmbox -y
sudo apt-get install albert slingscold -y
sudo apt install libertine libertine-scope libertine-tools gtk-recordmydesktop -y

sudo apt-get -yqq install y-ppa-manager

sudo apt-get install -yqq git git-gui kdiff3

git config --global user.name "Andrey Starkov"
git config --global user.email im@andreystarkov.ru
git config --global merge.tool kdiff3
git config --global mergetool.keepBackup false

sudo apt-get install papirus-gtk-icon-theme -y
sudo apt-get install papirus-* -y
sudo apt-get install numix-* -y
sudo apt-get install paper-* -y
sudo apt-get install guake -y
# sudo apt-get install moka-icon-theme -y

sudo cd /tmp; wget https://github.com/anmoljagetia/Flatabulous/archive/master.zip; unzip master.zip
sudo mv Flatabulous-master /usr/share/themes

sudo apt-get -yqq install y-ppa-manager
sudo apt-get install -yqq git git-gui kdiff3 nodejs npm build-essential libssl-dev
sudo apt-get install stow -y

sudo apt-get install zsh -y
sudo apt-get install guake -y

cd ~
git clone https://github.com/tarjoilija/zgen
git clone https://github.com/tarjoilija/zgen.git ~/.zgen
git clone https://github.com/unixorn/zsh-quickstart-kit
stow --target=~/zsh-quickstart-kit zsh

git config --global user.name "Andrey Starkov"
git config --global user.email im@andreystarkov.ru
git config --global merge.tool kdiff3
git config --global mergetool.keepBackup false

sudo apt-get install papirus-gtk-icon-theme -y
sudo apt-get install papirus-* -y
sudo apt-get install numix-* -y
sudo apt-get install paper-* -y

sudo apt-get install moka-icon-theme -y

sudo cd /tmp; wget https://github.com/anmoljagetia/Flatabulous/archive/master.zip; unzip master.zip
sudo mv Flatabulous-master /usr/share/themes

sudo apt-get install atom -y

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

cd /tmp
git clone https://github.com/daniruiz/Flat-Remix
mkdir -p ~/.icons
mv "Flat-Remix/Flat Remix" ~/.icons

cd ~
git clone https://github.com/NitruxSA/luv-icon-theme.git
cd luv-icon-theme
cp -rf ./L* ~/.icons
cp -rf ./Wallpapers ~/Pictures/Wallpapers

sudo apt-get -yqq install vlc shutter -y

sudo apt-get update -y
sudo apt-get install plank -y
sudo apt-get install ubuntu-tweak -y
sudo apt-get install gnome-tweak-tool -y

sudo xhost +SI:localuser:lightdm
sudo su lightdm -s /bin/bash
gsettings set com.canonical.unity-greeter draw-grid false;exit

wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac/macfonts.zip
sudo unzip mac-fonts.zip -d /usr/share/fonts; rm mac-fonts.zip
sudo fc-cache -f -v

sudo apt remove wine wine1.8 wine-stable libwine* fonts-wine* -y && sudo apt autoremove
sudo apt remove wine1.8 wine-staging -y && sudo apt autoremove

sudo apt-get install --install-recommends wine-staging -y
sudo apt-get install winehq-staging -y

sudo apt install geary -y

sudo apt-get -fqq install
sudo apt-get -yqq autoremove
sudo apt-get -yqq autoclean
sudo apt-get -yqq clean
