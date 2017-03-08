#!/bin/bash
# Perfect ubuntu
# https://github.com/andreystarkov/perfect-ubuntu
# in progress.

HOME_ROOT="/home/deo"
GIT_NAME="Andrey Starkov"
GIT_EMAIL="im@andreystarkov"

function cecho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}

cecho 'Preparing...' cyan
sudo apt-get install figlet -yqq >> ~/Desktop/perfect.log 2>&1

figlet -c 'Perfect Ubuntu'
cecho 'Perfect enviroment for 16.04/16.10' magenta
cecho 'https://github.com/andreystarkov/perfect-ubuntu' cyan
cecho 'Adding repositories...' yellow

#sudo apt-add-repository ppa:docky-core/stable -y
#sudo add-apt-repository ppa:tualatrix/ppa -y
sudo add-apt-repository ppa:webupd8team/atom -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:dhor/myway -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:pmjdebruijn/darktable-unstable -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:noobslab/themes -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:noobslab/macbuntu -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:wine/wine-builds -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:teejee2008/ppa -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:geary-team/releases -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:wine/wine-builds -y >> ~/Desktop/perfect.log 2>&1
sudo add-apt-repository ppa:mhsabbagh/greenproject -y >> ~/Desktop/perfect.log 2>&1

sudo dpkg --add-architecture amd64

cecho 'Updating repositories...' yellow
sudo apt-get update >> ~/Desktop/perfect.log 2>&1
cecho 'Upgrading...' cyan
sudo apt upgrade >> ~/Desktop/perfect.log 2>&1

cecho 'Installing preload...' yellow
sudo apt-get install preload -yqq>> ~/Desktop/perfect.log 2>&1
ccho 'Installing must-have tools...'
sudo apt-get install plank ubuntu-tweak gnome-tweak-tool -yqq >> ~/Desktop/perfect.log 2>&1
sudo apt install ubuntu-restricted-extras -yqq >> ~/Desktop/perfect.log 2>&1
sudo apt install libavcodec-extra -yqq >> ~/Desktop/perfect.log 2>&1
sudo apt-get install synaptic gdebi -yqq >> ~/Desktop/perfect.log 2>&1

#    ____                 _                                  _
#   |  _ \  _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_
#   | | | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
#   | |_| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_
#   |____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|

figlet -c 'perfect dev'

echo 'Installing git...'
sudo apt-get install git git-gui kdiff3 -yqq >> ~/Desktop/perfect.log 2>&1
echo 'Installing nodejs...'
sudo apt-get install nodejs npm build-essential libssl-dev -yqq >> ~/Desktop/perfect.log 2>&1
echo 'Installing nvm...'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash >> ~/Desktop/perfect.log 2>&1

echo 'Installing zsh...'
sudo apt-get install zsh -yqq >> ~/Desktop/perfect.log 2>&1
echo 'Installing guake...'
sudo apt-get install guake -yqq >> ~/Desktop/perfect.log 2>&1

echo 'Installing sexy ZSH enviroment...'
sudo apt-get install stow -yqq >> ~/Desktop/perfect.log 2>&1
cd ~
echo 'Installing zgen...'
git clone https://github.com/tarjoilija/zgen >> ~/Desktop/perfect.log 2>&1
cp -rf ~/zgen ~/.zgen

echo 'Installing ZSH Quickstart Kit (oh-my-zsh & other good stuff)...'
git clone https://github.com/unixorn/zsh-quickstart-kit >> ~/Desktop/perfect.log 2>&1
cd zsh-quickstart-kit
stow --target=${HOME_ROOT} zsh
sudo apt-get install ranger peco -yqq >> ~/Desktop/perfect.log 2>&1
cd ~

echo 'Setting up git...'
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL
git config --global merge.tool kdiff3
git config --global mergetool.keepBackup false

echo 'Installing Atom...'
sudo apt-get install atom -yqq >> ~/Desktop/perfect.log 2>&1


#   _                _       ___      __           _
#  | |    ___   ___ | | __  ( _ )    / _| ___  ___| |
#  | |   / _ \ / _ \| |/ /  / _ \/\ | |_ / _ \/ _ \ |
#  | |__| (_) | (_) |   <  | (_>  < |  _|  __/  __/ |
#  |_____\___/ \___/|_|\_\  \___/\/ |_|  \___|\___|_|

OUT="> /dev/null 2>&1"

figlet -c 'perfect look'
figlet -c -f small 'enjoyful'

echo "Installing Papirus..."
cd ~
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-home-gtk.sh | sh >> ~/Desktop/perfect.log 2>&1
# sudo apt-get install papirus-gtk-icon-theme -y'

echo "Installing Numix..."
sudo apt-get install numix-* -yqq >> ~/Desktop/perfect.log 2>&1
cd /tmp

echo "Installing Plank themes..."
wget http://github.com/KenHarkey/plank-themes/archive/master.zip >> ~/Desktop/perfect.log 2>&1
unzip master.zip
cp -rf plank-themes-master/* ~/.local/share/plank/themes
rm master.zip
cd /tmp

echo "Installing OSX Arc White theme..."
wget http://github.com/LinxGem33/OSX-Arc-White/archive/master.zip >> ~/Desktop/perfect.log 2>&1
unzip master.zip
sudo cp -rf OSX-Arc-White-master /usr/local/share/themes
rm master.zip

echo "Installing Paper GTK Theme"
sudo add-apt-repository ppa:snwh/pulp -y >> ~/Desktop/perfect.log 2>&1
sudo apt-get update >> ~/Desktop/perfect.log 2>&1
sudo apt-get install paper-gtk-theme -yqq >> ~/Desktop/perfect.log 2>&1
sudo apt-get install paper-icon-theme -yqq >> ~/Desktop/perfect.log 2>&1

echo "Installing Arc Themes & Icons"
sudo apt-get install arc-* -yqq >> ~/Desktop/perfect.log 2>&1

cecho "Installing Vimix Theme" yellow
echo "Adding PPA..."
sudo add-apt-repository ppa:noobslab/themes -y >> ~/Desktop/perfect.log 2>&1
sudo apt-get update >> ~/Desktop/perfect.log 2>&1
echo "Installing..."
sudo apt-get install vimix-gtk-themes -yqq >> ~/Desktop/perfect.log 2>&1
sudo apt-get install vimix-flat-themes -yqq >> ~/Desktop/perfect.log 2>&1

# sudo apt-get install moka-icon-theme -y
mkdir -p ~/.icons
cd /tmp

# sudo apt-get install flatabulous-theme -y
echo 'Installing Flatabulous theme...'
wget http://github.com/anmoljagetia/Flatabulous/archive/master.zip >> ~/Desktop/perfect.log 2>&1
unzip master.zip >> ~/Desktop/perfect.log 2>&1
sudo cp -rf Flatabulous-master /usr/share/themes

echo 'Installing Flat Remix icon pack...'
git clone https://github.com/daniruiz/Flat-Remix >> ~/Desktop/perfect.log 2>&1
cp -rf "Flat-Remix/Flat Remix" ~/.icons

echo 'Installing Luv icon pack...'
git clone https://github.com/NitruxSA/luv-icon-theme.git
cp -rf ./luv-icon-theme/L* ~/.icons


#cp -rf ./Wallpapers ~/Pictures/Wallpapers
echo 'Downloading Google fonts...'
wget https://raw.githubusercontent.com/hotice/webupd8/master/install-google-fonts >> ~/Desktop/perfect.log 2>&1
chmod +x install-google-fonts
echo 'Installing fonts...'
./install-google-fonts >> ~/Desktop/perfect.log 2>&1

echo 'Installing Mac fonts...'
wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac/macfonts.zip >> ~/Desktop/perfect.log 2>&1
sudo unzip mac-fonts.zip -d /usr/share/fonts
rm mac-fonts.zip
sudo fc-cache -f -v >> ~/Desktop/perfect.log 2>&1

#   ____            _                   _                      _
#  / ___| _   _ ___| |_ ___ _ __ ___   | |___      _____  __ _| | _____
#  \___ \| | | / __| __/ _ \ '_ ` _ \  | __\ \ /\ / / _ \/ _` | |/ / __|
#   ___) | |_| \__ \ ||  __/ | | | | | | |_ \ V  V /  __/ (_| |   <\__ \
#  |____/ \__, |___/\__\___|_| |_| |_|  \__| \_/\_/ \___|\__,_|_|\_\___/
#         |___/

figlet -c 'system tweaks'

echo 'Disabling guest session...'
sudo sh -c "echo 'allow-guest=false' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf"

echo 'Enabling minimize on click...'
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

# remove dots and ubuntu logo

sudo xhost +SI:localuser:lightdm
sudo su lightdm -s /bin/bash
gsettings set com.canonical.unity-greeter draw-grid false;exit
sudo mv /usr/share/unity-greeter/logo.png /usr/share/unity-greeter/logo.png.backup
cd;wget -O logo.png http://drive.noobslab.com/data/Mac-14.10/ubuntu_logo.png
sudo mv logo.png /usr/share/unity-greeter/;gsettings set com.canonical.unity-greeter draw-grid false

# mac fonts
wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac-14.10/macfonts.zip
sudo unzip mac-fonts.zip -d /usr/share/fonts; rm mac-fonts.zip
sudo fc-cache -f -v

# change launcher logo
wget -O launcher_bfb.png http://drive.noobslab.com/data/Mac-14.10/launcher-logo/apple/launcher_bfb.png
sudo mv launcher_bfb.png /usr/share/unity/icons/

# swap tweak
sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"

# echo 'Disabling packagekit...'
# sudo systemctl status packagekit.service
# sudo systemctl stop packagekit.service
# sudo systemctl disable packagekit.service
# sudo systemctl status packagekit.service

#      _                       ___     _              _
#     / \   _ __  _ __  ___   ( _ )   | |_ ___   ___ | |___
#    / _ \ | '_ \| '_ \/ __|  / _ \/\ | __/ _ \ / _ \| / __|
#   / ___ \| |_) | |_) \__ \ | (_>  < | || (_) | (_) | \__ \
#  /_/   \_\ .__/| .__/|___/  \___/\/  \__\___/ \___/|_|___/
#          |_|   |_|


figlet -c 'perfect apps'

echo 'Installing Chrome...'
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' >> ~/Desktop/perfect.log 2>&1
sudo apt update >> ~/Desktop/perfect.log 2>&1
sudo apt-get install google-chrome-stable -yqq >> ~/Desktop/perfect.log 2>&1

echo 'Installing Firefox...'
sudo apt-get install firefox -yqq >> ~/Desktop/perfect.log 2>&1

echo 'Installing core apps...'
sudo apt-get install indicator-multiload virtualbox virtualbox-guest-additions-iso -yqq >> ~/Desktop/perfect.log 2>&1
sudo apt-get install vlc shutter deluge -yqq >> ~/Desktop/perfect.log 2>&1
sudo apt-get install gpick -yqq >> ~/Desktop/perfect.log 2>&1

echo 'Installing inkscape...'
sudo apt-get install inkscape -yqq >> ~/Desktop/perfect.log 2>&1

echo 'Installing Compizconfig Settings Manager...'
sudo apt-get install compizconfig-settings-manager -yqq >> ~/Desktop/perfect.log 2>&1

echo 'Installing WineHQ...'

echo 'Installing Bleachbit...'
sudo apt-get install bleachbit -yqq >> ~/Desktop/perfect.log 2>&1

sudo apt-get -yqq install y-ppa-manager >> ~/Desktop/perfect.log 2>&1

# echo 'Installing alternative launchers (albert, slingscold)...'
# sudo apt-get install albert slingscold -yqq
# sudo apt install libertine libertine-scope libertine-tools -yqq

cecho 'Graphic tools installing...' cyan
# useful graphics editing apps
# sudo apt-get install darktable -y
# sudo apt install rawtherapee -y
#
sudo apt-get install mypaint -yqq >> ~/Desktop/perfect.log 2>&1

# sudo apt-get install aptik -yqq

# echo 'Installing Geary mail client...'
# sudo apt install geary -yqq

# echo 'Installing recordmydesktop...'
# sudo apt-get install gtk-recordmydesktop -yqq
# sudo apt install green-recorder -yqq

sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y >> ~/Desktop/perfect.log 2>&1
sudo apt-get update >> ~/Desktop/perfect.log 2>&1
sudo apt-get install simplescreenrecorder -yqq  >> ~/Desktop/perfect.log 2>&1

cecho 'Installing Peek...' yellow
sudo add-apt-repository ppa:peek-developers/stable >> ~/Desktop/perfect.log 2>&1
sudo apt update >> ~/Desktop/perfect.log 2>&1
sudo apt install peek >> ~/Desktop/perfect.log 2>&1

# sudo add-apt-repository ppa:docky-core/ppa
# sudo apt-get update
# sudo apt-get install docky

#sudo apt-get install docker-engine
sudo apt-get purge apt-xapian-index >> ~/Desktop/perfect.log 2>&1


cecho 'Installing Ubuntu Cleaner...' yellow
sudo add-apt-repository ppa:gerardpuig/ppa -y >> ~/Desktop/perfect.log 2>&1
sudo apt-get update >> ~/Desktop/perfect.log 2>&1
sudo apt-get install ubuntu-cleaner -yq >> ~/Desktop/perfect.log 2>&1

# login screen. looks perfect but dangerous (not tested)

# cecho 'Installing custom login screen...' yellow
# sudo add-apt-repository ppa:noobslab/themes -y >> ~/Desktop/perfect.log 2>&1
# sudo apt-get update >> ~/Desktop/perfect.log 2>&1
# sudo apt-get install mbuntu-y-lightdm-v4 -yq >> ~/Desktop/perfect.log 2>&1

#sudo add-apt-repository ppa:agornostal/ulauncher -y  >> ~/Desktop/perfect.log 2>&1
#sudo apt-get update >> ~/Desktop/perfect.log 2>&1
#sudo apt-get install ulauncher >> ~/Desktop/perfect.log 2>&1

cecho 'Installing Telegram...' yellow

sudo add-apt-repository ppa:costales/unity-webapps-telegram -y >> ~/Desktop/perfect.log 2>&1
sudo apt-get update  >> ~/Desktop/perfect.log 2>&1
sudo apt-get install unity-webapps-telegram -yqq >> ~/Desktop/perfect.log 2>&1

echo 'Installing Green Recorder...'
sudo add-apt-repository ppa:mhsabbagh/greenproject -y >> ~/perfect-install.log
sudo apt update -yqq >> ~/perfect-install.log
sudo apt install green-recorder -yqq >> ~/perfect-install.log

sudo apt-get -fqq install >> ~/perfect-install.log
sudo apt-get -yqq autoremove >> ~/perfect-install.log
sudo apt-get -yqq autoclean >> ~/perfect-install.log
sudo apt-get -yqq clean >> ~/perfect-install.log
