/* 
   Post-install script for Ubuntu 16.04.
   Just-add-water, Looking fine Javascript Development Enviroment

   https://github.com/andreystarkov/perfect-ubuntu
*/

sudo apt install figlet -yqq
figlet -c 'Perfect Ubuntu 16.04'
sudo apt update
sudo apt -yqq upgrade
sudo apt dist-upgrade

sudo apt -yqq install software-properties-common build-essential checkinstall wget curl git libssl-dev apt-transport-https ca-certificates
# sudo apt -yqq install libavahi-compat-libdnssd-dev

# git config --global user.name "Andrey Starkov"
# git config --global user.email im@andreystarkov

sudo apt-get install stow -y

sudo -H apt -yqq install python-pip
sudo -H pip install --upgrade pip

sudo apt -yqq install ruby ruby-dev ruby-bundler
sudo gem install bundler

sudo apt-get install plank -yqq

# rm -f google-chrome-stable_current_amd64.deb
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt -yqq install libappindicator1 libindicator7
# sudo dpkg -i google-chrome-stable_current_amd64.deb
# rm -f google-chrome-stable_current_amd64.deb

# sudo apt -yqq install gimp gimp-data gimp-plugin-registry gimp-data-extras geeqie graphviz libav-tools jpegoptim

sudo apt-get install tor-browser -yqq

sudo apt -yqq install nautilus-image-converter nautilus-compare nautilus-wipe
# sudo add-apt-repository -yqq ppa:nilarimogard/webupd8
# sudo apt-get update
# sudo apt -yqq install nautilus-columns

sudo apt -yqq install exfat-fuse exfat-utils e2fsprogs mtools dosfstools hfsutils hfsprogs jfsutils util-linux lvm2 nilfs-tools ntfs-3g reiser4progs reiserfsprogs xfsprogs attr quota f2fs-tools sshfs go-mtpfs jmtpfs

sudo apt -yqq install nautilus-dropbox

sudo apt -yqq install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

sudo apt -yqq install vlc ubuntu-restricted-extras libavcodec-extra

sudo apt -yqq install pandoc pandoc-citeproc texlive texlive-latex-extra texlive-latex-base texlive-fonts-recommended texlive-latex-recommended texlive-latex-extra texlive-lang-german texlive-xetex preview-latex-style dvipng nbibtex

sudo apt -yqq install htop meld guake password-gorilla keepassx retext vim geany ghex myrepos baobab notepadpp

# sudo apt -yqq install icedtea-8-plugin openjdk-8-jre subversion rabbitvcs-nautilus git curl vim network-manager-openvpn gparted gnome-disk-utility usb-creator-gtk traceroute cloc whois mssh inotify-tools openssh-server sqlite3 etckeeper stress gksu ntp

sudo apt -yqq install python-keyring python-gnomekeyring
sudo apt -yqq install smartmontools gsmartcontrol smart-notifier
echo "fs.inotify.max_user_watches = 524288" | sudo tee /etc/sysctl.d/60-inotify.conf
sudo service procps restart

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
make update
sudo apt-get install -yqq nodejs build-essential npm
sudo apt-get install -yqq npm

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
rm -f gitkraken-amd64.deb

sudo wget -O - https://tagplus5.github.io/vscode-ppa/ubuntu/gpg.key | sudo apt-key add - && \
sudo wget -O /etc/apt/sources.list.d/vscode.list https://tagplus5.github.io/vscode-ppa/ubuntu/vscode.list && \
sudo apt update &&
sudo apt -yqq install code code-insiders

mkdir -p ~/.fonts/

wget -O sf-fonts.zip https://github.com/AppleDesignResources/SanFranciscoFont/archive/master.zip
sudo unzip sf-fonts.zip -d /usr/share/fonts

rm -f ~/.fonts/FiraCode-*
wget https://github.com/tonsky/FiraCode/raw/master/distr/otf/FiraCode-Bold.otf -O ~/.fonts/FiraCode-Bold.otf
wget https://github.com/tonsky/FiraCode/raw/master/distr/otf/FiraCode-Light.otf -O ~/.fonts/FiraCode-Light.otf
wget https://github.com/tonsky/FiraCode/raw/master/distr/otf/FiraCode-Medium.otf -O ~/.fonts/FiraCode-Medium.otf
wget https://github.com/tonsky/FiraCode/raw/master/distr/otf/FiraCode-Regular.otf -O ~/.fonts/FiraCode-Regular.otf
wget https://github.com/tonsky/FiraCode/raw/master/distr/otf/FiraCode-Retina.otf -O ~/.fonts/FiraCode-Retina.otf
fc-cache -v

mkdir ~/.themes
git clone https://github.com/EliverLara/Ant-Nebula ~/.themes/Ant-Nebula
git clone https://github.com/EliverLara/Ant ~/.themes/Ant
git clone https://github.com/EliverLara/Ant-Bloody ~/.themes/Ant-Bloody

gsettings set org.gnome.desktop.interface gtk-theme "Ant"
gsettings set org.gnome.desktop.wm.preferences theme "Ant"

git clone https://github.com/KenHarkey/plank-themes ~/plank-themes
cd ~/plank-themes
bash ./install.sh
cd ~ && mkdir -p ~/.temp-plank-themer && cd ~/.temp-plank-themer && wget https://github.com/rhoconlinux/plank-themer/archive/master.zip && unzip master.zip && cd plank-themer-master/ && rm -fR ~/.config/plank/dock1/theme_index; rm -fR ~/.config/plank/dock1/themes-repo; cp -a theme_index/ ~/.config/plank/dock1 && cp -a themes-repo/ ~/.config/plank/dock1 && cd ~ && rm -R ~/.temp-plank-themer && sh ~/.config/plank/dock1/theme_index/plank-on-dock-themer.sh


rm -rf /tmp/Plank-Themes

git clone https://github.com/erikdubois/Plank-Themes /tmp/Plank-Themes
find /tmp/Plank-Themes -maxdepth 1 -type f -exec rm -rf '{}' \;
[ -d $HOME"/.local/share/plank" ] || mkdir -p $HOME"/.local/share/plank"
[ -d $HOME"/.local/share/plank/themes" ] || mkdir -p $HOME"/.local/share/plank/themes"

cp -r /tmp/Plank-Themes/* ~/.local/share/plank/themes/

rm -rf /tmp/Plank-Themes

sudo apt-get install zsh -y
cd ~
git clone https://github.com/tarjoilija/zgen
#cp -rf ~/zgen ~/.zgen
git clone https://github.com/unixorn/zsh-quickstart-kit
cd zsh-quickstart-kit
stow --target=/home/deo zsh

sudo apt-get install ranger -yqq

sudo npm i -g create-react-app
sudo npm install -g yarn
sudo npm install -g flow-bin
sudo npm install -g create-react-native-app
sudo npm install -g npm-check-updates
sudo npm install -g create-react-app
sudo npm install -g npm-check-updates
sudo npm install -g react-native-cli
sudo npm install -g ignite-cli
sudo npm install -g reactotron-cli
sudo npm install -g reactotron
sudo npm install -g rnpm

# git clone https://github.com/tliron/install-gnome-themes ~/install-gnome-themes
# ~/install-gnome-themes/install-gnome-themes

sudo add-apt-repository ppa:
/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme -y

gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
gsettings set org.gnome.desktop.interface gtk-theme "Ant"
gsettings set org.gnome.desktop.wm.preferences theme "Ant"

