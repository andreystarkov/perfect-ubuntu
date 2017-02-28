figlet -c 'perfect look'
figlet -c -f small 'enjoyful'

echo "Installing Papirus..."
cd ~
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-home-gtk.sh | sh
# sudo apt-get install papirus-gtk-icon-theme -y'

echo "Installing Numix..."
sudo apt-get install numix-* -yqq
cd /tmp

echo "Installing Plank themes..."
wget http://github.com/KenHarkey/plank-themes/archive/master.zip
unzip master.zip
cp -rf plank-themes-master/* ~/.local/share/plank/themes
rm master.zip
cd /tmp

echo "Installing OSX Arc White theme..."
wget http://github.com/LinxGem33/OSX-Arc-White/archive/master.zip
unzip master.zip
sudo cp -rf OSX-Arc-White-master /usr/local/share/themes
rm master.zip

echo "Installing Paper GTK Theme"
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt-get update
sudo apt-get install paper-gtk-theme -yqq
sudo apt-get install paper-icon-theme -yqq

echo "Installing Arc Themes & Icons"
sudo apt-get install arc-* -yqq

# sudo apt-get install moka-icon-theme -y
mkdir -p ~/.icons

cd /tmp

# sudo apt-get install flatabulous-theme -y
echo 'Installing Flatabulous theme...'
wget http://github.com/anmoljagetia/Flatabulous/archive/master.zip
unzip master.zip
sudo cp -rf Flatabulous-master /usr/share/themes

echo 'Installing Flat Remix icon pack...'
git clone https://github.com/daniruiz/Flat-Remix
cp -rf "Flat-Remix/Flat Remix" ~/.icons

echo 'Installing Luv icon pack...'
git clone https://github.com/NitruxSA/luv-icon-theme.git
cp -rf ./luv-icon-theme/L* ~/.icons

#cp -rf ./Wallpapers ~/Pictures/Wallpapers
echo 'Downloading fonts...'
wget https://raw.githubusercontent.com/hotice/webupd8/master/install-google-fonts
chmod +x install-google-fonts
echo 'Installing fonts...'
./install-google-fonts

# wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac/macfonts.zip
# sudo unzip mac-fonts.zip -d /usr/share/fonts; rm mac-fonts.zip
# sudo fc-cache -f -v
