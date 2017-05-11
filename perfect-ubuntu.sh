#!/bin/bash
# Perfect ubuntu
# https://github.com/andreystarkov/perfect-ubuntu
# in progress.

# Passed fine on 16.04/16.10

HOME_ROOT="~/"
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
        green) color=2 ;;7
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;;
       esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}

cecho 'Preparing...' cyan
sudo apt-get install figlet -yqq
sudo apt-get install wget curl -yqq
cecho 'Installing git...' red
sudo apt-get install git kdiff3 git-core -yqq

figlet -c 'Perfect Ubuntu'
cecho 'Perfect enviroment for 16.04/16.10' magenta
cecho 'https://github.com/andreystarkov/perfect-ubuntu' cyan

cecho 'Removing pre-installed wtf...' magenta
sudo apt remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku -y
sudo apt-get purge modemmanager -yqq
sudo apt-get purge apt-xapian-index

cecho 'Adding repositories...' yellow

#sudo add-apt-repository ppa:tualatrix/ppa -y
sudo add-apt-repository ppa:webupd8team/atom -y
sudo add-apt-repository ppa:dhor/myway -y
sudo add-apt-repository ppa:pmjdebruijn/darktable-unstable -y
sudo add-apt-repository ppa:noobslab/themes -y
sudo add-apt-repository ppa:noobslab/macbuntu -y
sudo add-apt-repository ppa:wine/wine-builds
sudo add-apt-repository ppa:teejee2008/ppa -y
sudo add-apt-repository ppa:geary-team/releases -y
sudo add-apt-repository ppa:mhsabbagh/greenproject -y
sudo add-apt-repository ppa:costales/unity-webapps-telegram -y
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo add-apt-repository ppa:gerardpuig/ppa -y
sudo add-apt-repository ppa:hluk/copyq -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo add-apt-repository ppa:notepadqq-team/notepadqq -y
sudo add-apt-repository ppa:oranchelo/oranchelo-icon-theme -y
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo add-apt-repository ppa:webupd8team/tor-browser -y
sudo add-apt-repository ppa:maarten-fonville/android-studio -y
sudo add-apt-repository ppa:kasra-mp/ubuntu-indicator-weather -y
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y

curl ftp://ftp.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -
echo "deb ftp://ftp.videolan.org/pub/debian/stable ./" | sudo tee /etc/apt/sources.list.d/libdvdcss.list

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo dpkg --add-architecture amd64

cecho 'Updating repositories...' yellow
sudo apt-get update -qq
cecho 'Upgrading...' cyan
sudo apt-get upgrade -qq
#sudo apt-get dist-upgrade -qq

cecho 'Installing preload...' yellow
sudo apt-get install preload -yqq

cecho 'Installing core apps, codecs ant utils...'
sudo apt-get install gksu -yqq
sudo apt-get install plank -yqq
sudo apt-get install gnome-tweak-tool -yqq
sudo apt-get install unity-tweak-tool -yqq
sudo apt-get install ubuntu-restricted-extras software-properties-common -yqq
sudo apt-get install libavcodec-extra -yqq
sudo apt-get install libdvdcss2 libdvdnav4 libdvdread4 -yqq
sudo apt-get install synaptic gdebi mc -yqq
sudo apt-get install compizconfig-settings-manager -yqq
sudo apt-get install compiz-plugins -yqq
sudo apt-get install compiz-plugins-extra -yqq

#    ____                 _                                  _
#   |  _ \  _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_
#   | | | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
#   | |_| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_
#   |____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|

figlet -c 'Development'

cecho 'Installing yarn...' cyan
sudo apt-get install yarn -yqq

cecho 'Installing nodejs...' magenta
sudo apt-get install build-essential -yqq
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install nodejs -yqq
sudo ln -s /usr/bin/nodejs /usr/bin/node

cecho 'Installing required tools...' blue
sudo apt-get install ruby rubygems ruby-dev -yqq
sudo apt-get install git-gui -yqq
sudo apt-get install autotools-dev -yqq
sudo apt-get install libssl-dev automake -yqq
sudo apt-get install python-dev -yqq
sudo npm install -g flow-bin -yqq
sudo apt-get install -y android-tools-adb android-tools-fastboot android-tools-fsutils gphoto2 jmtpfs mtpfs -yqq
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -yqq
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils -yqq
sudo apt-get install android-tools-adb -yqq
sudo apt-get install gradle -yqq
sudo apt-get install ubuntu-make -yqq

# cecho 'Installing React Native CLI...' red
# curl -0 -L https://npmjs.org/install.sh | sudo sh.
# cecho 'Installing Android Studio...' cyan
# sudo add-apt-repository ppa:paolorotolo/android-studio -Y
# sudo apt-get install android-studio -yqq

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

cecho 'Installing Atom...' yellow
sudo apt-get install atom -yqq

cecho 'Installing sync-settings...' blue
apm install sync-settings
cecho '.' black
cecho 'My atom ES6/React/Native IDE setup:' magenta
cecho 'https://gist.github.com/andreystarkov/8839ca26a3bb21243455b8b92386937a' cyan
cecho '.' black
cecho 'Install Atom plugins....' red
apm install nuclide react atom-ternjs
apm install react-es6-snippets react-native-snippets react-redux-snippets
apm install color-picker seti-icons minimap pigments docblockr
apm install editorconfig set-syntax synced-sidebar
apm install autocomplete-modules
apm install highlight-selected highlight-line text minimap-highlight-selected
apm install duplicate-line-or-selection
apm install css-declaration-sorter
apm install intentions busy-signal
apm install atom-beautify
apm install linter linter-ui-default linter-js-standard standard-formatter
apm install linter-eslint
apm install linter-write-good
apm install linter-csslint linter-scss-lint
apm install linter-markdown markdown-preview-plus
apm install project-plus custom-title project-manager
apm install git-plus git-time-machine git-projects merge-conflicts scroll-through-time

# More useful plugins:
# apm install todo-show imdone-atom autoclose-html
# apm install simple-drag-drop-remote-edit
# apm install advanced-open-file copy-paste sort-lines sorter

cecho 'Install Atom themes....' cyan
apm install nucleus-dark-ui atom-panda-syntax atom-material-syntax-dark

# apm install hybrid-next-syntax ariake-dark-syntax one-dark-vivid-syntax nebula-ui predawn-ui seti-ui-red flexible-ui
# apm install seti-classic isotope-ui dark-flat-ui outlander-ui next-dark-ui

cecho 'Install everything for React/Native....' yellow

cecho 'Install Java....' blue
sudo apt-get install default-jre default-jdk -yqq
sudo apt-get install oracle-java8-installer -yqq
sudo apt-get install oracle-java8-set-default -yqq

cecho 'Install Android Studio....' green
sudo apt install android-studio -yqq

cecho 'Installing watchman...' magenta
git clone https://github.com/facebook/watchman.git
cd watchman
git checkout v4.1.0
./autogen.sh
./configure
make
sudo make install
cd ~

sudo apt-get install gradle -yqq
touch ~/.gradle/gradle.properties && echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties
sudo npm install -g flow-bin
sudo npm install -g create-react-native-app
sudo npm install -g create-react-app
sudo npm install -g npm-check-updates
sudo npm install -g react-native-cli
sudo npm install -g ignite-cli
sudo npm install -g reactotron-cli
sudo npm install -g reactotron
sudo npm install -g rnpm 
# wget https://release.gitkraken.com/linux/gitkraken-amd64.deb ~/Desktop

#   _                _       ___      __           _
#  | |    ___   ___ | | __  ( _ )    / _| ___  ___| |
#  | |   / _ \ / _ \| |/ /  / _ \/\ | |_ / _ \/ _ \ |
#  | |__| (_) | (_) |   <  | (_>  < |  _|  __/  __/ |
#  |_____\___/ \___/|_|\_\  \___/\/ |_|  \___|\___|_|


figlet -c 'Look & Feel'

cecho "Installing Gnome Themes..." yellow
cecho "https://github.com/tliron/install-gnome-themes" white
git clone https://github.com/tliron/install-gnome-themes ~/install-gnome-themes
~/install-gnome-themes/install-gnome-themes

cecho "Installing Papirus..." red
cd ~
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-home-gtk.sh | sh
# sudo apt-get install papirus-gtk-icon-theme -y'

# cecho "Installing Numix..." redвфы
# sudo apt-get install numix-* -yqq

cd /tmp
cecho "Installing Plank themes..." magenta
wget http://github.com/KenHarkey/plank-themes/archive/master.zip
unzip master.zip
cp -rf plank-themes-master/* ~/.local/share/plank/themes
rm master.zip

cecho "Installing OSX Arc White theme..." white
wget http://github.com/LinxGem33/OSX-Arc-White/archive/master.zip ./
unzip ./master.zip
sudo cp -rf ./OSX-Arc-White-master /usr/local/share/themes
rm ./master.zip
cd ~/

# cecho "Installing Paper GTK Theme" cyan
# sudo apt-get install paper-gtk-theme -yqq
# sudo apt-get install paper-icon-theme -yqq

# cecho "Installing Arc Themes & Icons" red
# sudo apt-get install arc-* -yqq

cecho "Installing Vimix Theme..." yellow
sudo apt-get install vimix-gtk-themes -yqq
sudo apt-get install vimix-flat-themes -yqq

cecho 'Install Oranchelo Icon Theme...' cyan
sudo apt-get install oranchelo-icon-theme -yqq

mkdir -p ~/.icons
cd /tmp

# sudo apt-get install flatabulous-theme -y
# cecho 'Installing Flatabulous theme...' magenta
# wget http://github.com/anmoljagetia/Flatabulous/archive/master.zip ./
# unzip ./master.zip
# sudo cp -rf ./Flatabulous-master /usr/share/themes

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

cecho 'Installing San Francisco font...' cyan
wget -O sf-fonts.zip https://github.com/AppleDesignResources/SanFranciscoFont/archive/master.zip
sudo unzip sf-fonts.zip -d /usr/share/fonts

cecho 'Installing Hack font...' blue
git clone https://github.com/AppleDesignResources/SanFranciscoFont.git /tmp/sf
sudo cp -rf /tmp/sf/)
DEST_DIR=~/.fonts/hack_typeface
mkdir -p $DEST_DIR

which unzip >/dev/null || (echo "INFO: I need to install unzip"; sudo apt-get install unzip)
wget --directory-prefix $DEST_DIR https://github.com/chrissimpkins/Hack/releases/download/v2.010/Hack-v2_010-otf.zip
unzip $DEST_DIR/Hack-*.zip -d $DEST_DIR
rm $DEST_DIR/Hack-*.zip

sudo fc-cache -f -v

cecho 'Installing Plank themes...' magenta
sudo apt-get install plank -yqq
git clone https://github.com/KenHarkey/plank-themes ~/plank-themes
cd ~/plank-themes
bash ./install.sh
cd ~ && mkdir -p ~/.temp-plank-themer && cd ~/.temp-plank-themer && wget https://github.com/rhoconlinux/plank-themer/archive/master.zip && unzip master.zip && cd plank-themer-master/ && rm -fR ~/.config/plank/dock1/theme_index; rm -fR ~/.config/plank/dock1/themes-repo; cp -a theme_index/ ~/.config/plank/dock1 && cp -a themes-repo/ ~/.config/plank/dock1 && cd ~ && rm -R ~/.temp-plank-themer && sh ~/.config/plank/dock1/theme_index/plank-on-dock-themer.sh

cecho 'Installing backgrounds....' cyan
sudo git clone https://github.com/andreystarkov/perfect-wallpapers /tmp/wallpapers
sudo mv -f /tmp/wallpapers/* /usr/share/backgrounds

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

org.gnome.desktop.wm.preferences titlebar-font 'SFNS Display Bold 11'
org.gnome.desktop.interface font-name 'SFNS Display Regular 10,5'
org.gnome.desktop.interface document-font-name 'SFNS Text MediumP4 11'
org.gnome.desktop.interface monospace-font-name 'Hack Regular 12'

org.gnome.desktop.privacy remember-recent-files false
# echo 'Disabling packagekit...'
# sudo systemctl status packagekit.service
# sudo systemctl stop packagekit.service
# sudo systemctl disable packagekit.service
# sudo systemctl status packagekit.service

# Autorun on startup
#
# /etc/init.d/perfect-startup
# echo "plank > /dev/null 2>&1 &" >> /etc/init.d/perfect-startup
# echo "guake > /dev/null 2>&1 &" >> /etc/init.d/perfect-startup
# echo "albert > /dev/null 2>&1 &" >> /etc/init.d/perfect-startup
# sudo chmod +x /etc/init.d/perfect-startup
# sudo update-rc.d perfect-startup defaults

# Disable guest session (not tested)
# sudo touch /etc/lightdm/lightdm.conf.d/50-no-guest.conf
# sudo echo "[SeatDefaults] allow-guest=false" > /etc/lightdm/lightdm.conf.d/50-no-guest.conf

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

cecho 'Installing Tor Browser...' red
sudo apt-get install tor-browser -yqq

cecho 'Installing Virtualbox...' magenta
sudo apt-get install virtualbox virtualbox-guest-additions-iso -yqq

cecho 'Installing VLC...' yellow
sudo apt-get install vlc vlc-data browser-plugin-vlc mplayer2 -yqq
sudo apt-get install vlc-plugin-* -yqq

cecho 'Installing WineHQ...' red
sudo dpkg --add-architecture i386
sudo apt-get install --install-recommends winehq-devel -yqq

cecho 'Installing Dropbox...' dropbox yellow
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

cecho 'Installing Bleachbit...' cyan
sudo apt-get install bleachbit -yqq

#sudo apt-get -yqq install y-ppa-manager

cecho 'Installing Steam...' blue
sudo apt-get install steam -yqq

cecho 'Installing Albert...' red
sudo apt-get install albert -yqq

# useful graphics editing apps
# sudo apt-get install darktable -y
# sudo apt-get install rawtherapee -y
# sudo apt-get install aptik -yqq

cecho 'Installing Mypaint...' cyan
sudo apt-get install mypaint -yqq

cecho 'Installing Inkscape...' blue
sudo apt-get install inkscape -yqq

cecho 'Installing Geary mail client...' red
sudo apt-get install geary -yqq

sudo apt-get install simplescreenrecorder -yqq

cecho 'Installing Peek...' yellow
sudo apt-get install peek -yqq

cecho 'Installing Ubuntu Cleaner...' cyan
sudo apt-get install ubuntu-cleaner -yq

cecho 'Installing Telegram...' yellow
sudo apt-get install unity-webapps-telegram -yqq

cecho 'Installing Green Recorder...' green
sudo apt-get install green-recorder -yqq

cecho 'Installing Gimp...' magenta
sudo apt-get install gimp -yqq
cecho 'Installing Gimp CC Themes...' yellow
git clone https://github.com/draekko/gimp-cc-themes ~/.gimp-2.8/themes

cecho 'Installing Conky...' magenta
sudo apt install conky -yqq

cecho 'Installing CopyQ...' red
sudo apt install copyq -yqq

cecho 'Installing Notepad++...' blue
sudo apt-get install notepadqq -yqq

cecho 'Installing Albert Launcher...' magenta
sudo apt-get install albert -yqq

cecho 'Installing Chrome...' yellow
sudo apt -y install google-chrome-stable -yqq

cecho 'Installing indicators...' red
sudo apt-get install indicator-multiload -yqq
sudo apt-get install indicator-weather -yqq

cecho 'Installing tools (torrents, screenshots, utils, etc...)' magenta
sudo apt-get install shutter -yqq
sudo apt-get install deluge -yqq
sudo apt-get install gpick -yqq
sudo apt-get install grub-customizer -yqq
sudo apt-get install lightdm-gtk-greeter-settings

cecho 'Cleaning...' yellow
sudo apt-get -fqq install
sudo apt-get -yqq autoremove
sudo apt-get -yqq autoclean
sudo apt-get -yqq clean

figlet 'Weehha'
cecho '.' black
cecho 'You did it. Configure and enjoy!' yellow
cecho '.' black
cecho 'If something went wrong create an issue here:' magenta
cecho 'https://github.com/andreystarkov/perfect-ubuntu' cyan
cecho '.' black

unity-tweak-tool > /dev/null 2>&1 &
plank --preferences > /dev/null 2>&1 &
