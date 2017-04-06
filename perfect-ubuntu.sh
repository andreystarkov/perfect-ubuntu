#!/bin/bash
# Perfect ubuntu
# https://github.com/andreystarkov/perfect-ubuntu
# in progress.

# Passed fine on 16.10

HOME_ROOT="/home/deo"
GIT_NAME="andreystarkov"
GIT_EMAIL="im@andreystarkov.ru"
OUT=" >> ~/Desktop/perfect.log 2>&1"

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
sudo apt-get install figlet -yqq

figlet -c 'Perfect Ubuntu'
cecho 'Perfect enviroment for 16.04/16.10' magenta
cecho 'https://github.com/andreystarkov/perfect-ubuntu' cyan
cecho 'Adding repositories...' yellow

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
sudo add-apt-repository ppa:costales/unity-webapps-telegram -y
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo dpkg --add-architecture amd64

cecho 'Updating repositories...' yellow
sudo apt-get update
cecho 'Upgrading...' cyan
sudo apt-get upgrade
sudo apt-get dist-upgrade -y
cecho 'Installing preload...' yellow
sudo apt-get install preload -yqq
cecho 'Installing must-have tools...'
sudo apt-get install plank -yqq
sudo apt-get install gnome-tweak-tool -yqq
sudo apt-get install unity-tweak-tool -yqq
sudo apt-get install ubuntu-restricted-extras -yqq
# sudo apt-get install libavcodec-extra -yqq
sudo apt-get install synaptic gdebi -yqq

cp -rf ./Wallpapers ~/Pictures/Wallpapers

#    ____                 _                                  _
#   |  _ \  _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_
#   | | | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
#   | |_| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_
#   |____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|

figlet -c 'Development'

figlet -f small -c '31337/true'

cecho 'Installing yarn...' cyan
sudo apt-get install yarn -yqq

cecho 'Installing git...' red
sudo apt-get install git git-gui kdiff3 -yqq
cecho 'Installing nodejs...' magenta
sudo apt-get install nodejs -yqq
sudo apt-get install build-essential libssl-dev -yqq
cecho 'Installing nvm...' yellow
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
sudo npm install -g node
nvm install node
cecho 'Installing zsh...' red
sudo apt-get install zsh -yqq
cecho 'Installing guake...' cyan
sudo apt-get install guake -yqq

cecho 'Installing sexy ZSH enviroment...' yellow
sudo apt-get install stow -yqq
cd ~
cecho 'Installing zgen...' blue
git clone https://github.com/tarjoilija/zgen
cp -rf ~/zgen ~/.zgen

cecho 'Installing ZSH Quickstart Kit (oh-my-zsh & other good stuff)...' magenta
git clone https://github.com/unixorn/zsh-quickstart-kit
cd zsh-quickstart-kit
stow --target=${HOME_ROOT} zsh
sudo apt-get install ranger -yqq
cd ~

cecho 'Setting up git...' cyan
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL
git config --global merge.tool kdiff3
git config --global mergetool.keepBackup false
git config --global credential.helper cache

cecho 'Installing Atom...' red
sudo apt-get install atom -yqq
apm install sync-settings

#   _                _       ___      __           _
#  | |    ___   ___ | | __  ( _ )    / _| ___  ___| |
#  | |   / _ \ / _ \| |/ /  / _ \/\ | |_ / _ \/ _ \ |
#  | |__| (_) | (_) |   <  | (_>  < |  _|  __/  __/ |
#  |_____\___/ \___/|_|\_\  \___/\/ |_|  \___|\___|_|


figlet -c 'Look & Feel'

cecho "Installing Papirus..." yellow
cd ~
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-home-gtk.sh | sh
# sudo apt-get install papirus-gtk-icon-theme -y'

# cecho "Installing Numix..." red
# sudo apt-get install numix-* -yqq
# cd /tmp

cecho "Installing Plank themes..." magenta
wget http://github.com/KenHarkey/plank-themes/archive/master.zip
unzip master.zip
cp -rf plank-themes-master/* ~/.local/share/plank/themes
rm master.zip
cd /tmp

cecho "Installing OSX Arc White theme..." white
wget http://github.com/LinxGem33/OSX-Arc-White/archive/master.zip ./
unzip ./master.zip
sudo cp -rf ./OSX-Arc-White-master /usr/local/share/themes
rm ./master.zip
cd ~/

cecho "Installing Paper GTK Theme" cyan
sudo apt-get install paper-gtk-theme -yqq
sudo apt-get install paper-icon-theme -yqq

cecho "Installing Arc Themes & Icons" red
sudo apt-get install arc-* -yqq

cecho "Installing Vimix Theme" yellow
sudo apt-get install vimix-gtk-themes -yqq
sudo apt-get install vimix-flat-themes -yqq

# sudo apt-get install moka-icon-theme -y
mkdir -p ~/.icons
cd /tmp

# sudo apt-get install flatabulous-theme -y
cecho 'Installing Flatabulous theme...' magenta
wget http://github.com/anmoljagetia/Flatabulous/archive/master.zip ./
unzip ./master.zip
sudo cp -rf ./Flatabulous-master /usr/share/themes

cecho 'Installing Flat Remix icon pack...' red
git clone https://github.com/daniruiz/Flat-Remix /tmp/Flat-Remix
cp -rf "Flat-Remix/Flat Remix" ~/.icons

cecho 'Installing Luv icon pack...' blue
git clone https://github.com/NitruxSA/luv-icon-theme.git
cp -rf ./luv-icon-theme/L* ~/.icons

cecho 'Downloading Google fonts...' yellow
wget https://raw.githubusercontent.com/hotice/webupd8/master/install-google-fonts
chmod +x install-google-fonts
cecho 'Installing fonts...' red
./install-google-fonts

cecho 'Installing Mac fonts...' cyan
wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac/macfonts.zip
sudo unzip mac-fonts.zip -d /usr/share/fonts
rm mac-fonts.zip
sudo fc-cache -f -v

# git clone https://github.com/supermarin/YosemiteSanFranciscoFont.git ~/Desktop

# plank themes
cecho 'Installing Plank themes...' magenta
sudo apt-get install plank -yqq
git clone https://github.com/KenHarkey/plank-themes ~/plank-themes
cd ~/plank-themes
bash ./install.sh
cd ~ && mkdir -p ~/.temp-plank-themer && cd ~/.temp-plank-themer && wget https://github.com/rhoconlinux/plank-themer/archive/master.zip && unzip master.zip && cd plank-themer-master/ && rm -fR ~/.config/plank/dock1/theme_index; rm -fR ~/.config/plank/dock1/themes-repo; cp -a theme_index/ ~/.config/plank/dock1 && cp -a themes-repo/ ~/.config/plank/dock1 && cd ~ && rm -R ~/.temp-plank-themer && sh ~/.config/plank/dock1/theme_index/plank-on-dock-themer.sh


#   ____            _                   _                      _
#  / ___| _   _ ___| |_ ___ _ __ ___   | |___      _____  __ _| | _____
#  \___ \| | | / __| __/ _ \ '_ ` _ \  | __\ \ /\ / / _ \/ _` | |/ / __|
#   ___) | |_| \__ \ ||  __/ | | | | | | |_ \ V  V /  __/ (_| |   <\__ \
#  |____/ \__, |___/\__\___|_| |_| |_|  \__| \_/\_/ \___|\__,_|_|\_\___/
#         |___/

figlet -c 'system tweaks'

cecho "." yellow
# sudo sh -c "echo 'allow-guest=false' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf"
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size 28
gsettings set com.canonical.Unity.Launcher launcher-position Left
gconftool-2 --type int --set "/apps/compiz-1/plugins/unityshell/screen0/options/launcher_hide_mode" 1
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
# gsettings set org.gnome.desktop.interface gtk-theme 'Vimixdark'
# gsettings set org.gnome.desktop.wm.preferences theme "Vimixdark"
# gconftool-2 --set "/apps/compiz-1/plugins/unityshell/screen0/options/launcher_hide_mode" --type string "1"
sudo service apport stop
# sudo echo "enabled=0" > /etc/default/apport
sudo apt-get purge apport
cecho ".." magenta
# swap tweak
# sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"

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


figlet -c 'Apps & tools'

cecho 'Installing Chrome...' yellow
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -yqq

cecho 'Installing Firefox...' red
sudo apt-get install firefox -yqq

cecho 'Installing core apps...' magenta
sudo apt-get install indicator-multiload virtualbox virtualbox-guest-additions-iso -yqq
sudo apt-get install vlc shutter deluge -yqq
sudo apt-get install gpick -yqq

cecho 'Installing Inkscape...' blue
sudo apt-get install inkscape -yqq

cecho 'Installing Compizconfig...' white
sudo apt-get install compizconfig-settings-manager -yqq
sudo apt-get install compiz-plugins -yqq
# echo 'Installing WineHQ...'

cecho 'Installing Dropbox...' dropbox yellow
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

cecho 'Installing Bleachbit...' cyan
sudo apt-get install bleachbit -yqq

sudo apt-get -yqq install y-ppa-manager
sudo apt-get install steam -yqq
# echo 'Installing alternative launchers (albert, slingscold)...'
# sudo apt-get install albert slingscold -yqq
# sudo apt-get install libertine libertine-scope libertine-tools -yqq

cecho 'Graphic tools installing...' cyan
# useful graphics editing apps
# sudo apt-get install darktable -y
# sudo apt-get install rawtherapee -y

sudo apt-get install mypaint -yqq

# sudo apt-get install aptik -yqq

cecho 'Installing Geary mail client...' red
sudo apt-get install geary -yqq

# echo 'Installing recordmydesktop...'
# sudo apt-get install gtk-recordmydesktop -yqq
# sudo apt-get install green-recorder -yqq

sudo apt-get install simplescreenrecorder -yqq

cecho 'Installing Peek...' yellow
sudo apt-get install peek -yqq

# sudo add-apt-repository ppa:docky-core/ppa
# sudo apt-get update
# sudo apt-get install docky

#sudo apt-get install docker-engine
sudo apt-get purge apt-xapian-index


cecho 'Installing Ubuntu Cleaner...' cyan
sudo add-apt-repository ppa:gerardpuig/ppa -y
sudo apt-get update
sudo apt-get install ubuntu-cleaner -yq

# login screen. looks perfect but dangerous (not tested)

# cecho 'Installing custom login screen...' yellow
# sudo add-apt-repository ppa:noobslab/themes -y
# sudo apt-get update
# sudo apt-get install mbuntu-y-lightdm-v4 -yq

#sudo add-apt-repository ppa:agornostal/ulauncher -y
#sudo apt-get update
#sudo apt-get install ulauncher

cecho 'Installing Telegram...' yellow


sudo apt-get update
sudo apt-get install unity-webapps-telegram -yqq

cecho 'Installing Green Recorder...' green
sudo apt-get install green-recorder -yqq

sudo apt-get -fqq install
sudo apt-get -yqq autoremove
sudo apt-get -yqq autoclean
sudo apt-get -yqq clean

unity-tweak-tool &
plank --preferences &
