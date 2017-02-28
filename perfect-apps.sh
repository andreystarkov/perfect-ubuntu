figlet -c 'perfect apps'
figlet -c -f small 'whatever tools'

echo 'Installing Chrome...'
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt-get install google-chrome-stable -yqq

echo 'Installing Firefox...'
sudo apt-get install firefox -yqq

echo 'Installing core apps...'
sudo apt-get install indicator-multiload virtualbox virtualbox-guest-additions-iso filezilla dropbox -yqq
sudo apt-get install vlc shutter doublecommander deluge -yqq
sudo apt-get install copyq gpick -yqq

echo 'Installing inkscape...'
sudo apt-get install inkscape -yqq

echo 'Installing Compizconfig Settings Manager...'
sudo apt-get install compizconfig-settings-manager -yqq

echo 'Installing WineHQ...'
sudo apt-get install winehq-devel -yqq
# sudo apt remove wine wine1.8 wine-stable libwine* fonts-wine* -y && sudo apt autoremove
# sudo apt remove wine1.8 wine-staging -yqq && sudo apt autoremove
# sudo apt-get install --install-recommends wine-staging -yqq

echo 'Installing Bleachbit (system cleaner)...'
sudo apt-get install bleachbit -yqq

# sudo apt-get install rhythmbox -y
# sudo apt-get install kazam -y
# sudo apt-get -yqq install y-ppa-manager


# echo 'Installing alternative launchers (albert, slingscold)...'
# sudo apt-get install albert slingscold -yqq
# sudo apt install libertine libertine-scope libertine-tools -yqq

# useful graphics editing apps
# sudo apt-get install darktable -y
# sudo apt install rawtherapee -y
# sudo apt-get install mypaint -yqq
# sudo apt-get install aptik -yqq

# echo 'Installing Geary mail client...'
# sudo apt install geary -yqq

# echo 'Installing recordmydesktop...'
# sudo apt-get install gtk-recordmydesktop -yqq

# echo 'Installing green-recorder...'
# sudo apt install green-recorder -yqq
