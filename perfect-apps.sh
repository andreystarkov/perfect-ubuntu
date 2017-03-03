figlet -c 'perfect apps'

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


# sudo apt install green-recorder -yqq

sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y > ~/Desktop/perfect.log 2>&1
sudo apt-get update > ~/Desktop/perfect.log 2>&1
sudo apt-get install simplescreenrecorder -yqq  > ~/Desktop/perfect.log 2>&1

sudo add-apt-repository ppa:peek-developers/stable -y  > ~/Desktop/perfect.log 2>&1
sudo apt-get update > ~/Desktop/perfect.log 2>&1
sudo apt install peek -yqq > ~/Desktop/perfect.log 2>&1
# sudo add-apt-repository ppa:docky-core/ppa
# sudo apt-get update
# sudo apt-get install docky

# sudo apt-get install docker-engine
# sudo apt-get purge apt-xapian-index

sudo add-apt-repository ppa:eviltwin1/feedreader-stable
sudo apt-get update
# splash

# sudo add-apt-repository ppa:noobslab/themes
# sudo apt-get update
# sudo apt-get install mbuntu-y-bscreen-v4

sudo add-apt-repository ppa:gerardpuig/ppa
sudo apt-get update && sudo apt-get install ubuntu-cleaner -yq
# login screen. looks perfect but dangerous (not tested)
# sudo add-apt-repository ppa:noobslab/themes
# sudo apt-get update
# sudo apt-get install mbuntu-y-lightdm-v4

# sudo add-apt-repository ppa:agornostal/ulauncher -y  > ~/Desktop/perfect.log 2>&1
# sudo apt-get update > ~/Desktop/perfect.log 2>&1
# sudo apt-get install ulauncher > ~/Desktop/perfect.log 2>&1
# figlet -c -f small "vimix theme"
# echo "https://github.com/vinceliuice/vimix-gtk-themes"
# echo "Installing..."
# echo "Adding PPA..."
# sudo add-apt-repository ppa:noobslab/themes -y > ~/Desktop/perfect.log 2>&1
# echo "Ok. Update reps then..."
# sudo apt-get update > ~/Desktop/perfect.log 2>&1
# echo "Ok. Now install..."
# sudo apt-get install vimix-gtk-themes -yqq > ~/Desktop/perfect.log 2>&1
# sudo apt-get install vimix-flat-themes -yqq > ~/Desktop/perfect.log 2>&1


figlet -c -f small 'screen capture tools'
3
echo 'Installing green-recorder...'
sudo add-apt-repository ppa:mhsabbagh/greenproject -y >> ~/perfect-install.log
sudo apt update && sudo apt install green-recorder -yqq >> ~/perfect-install.log
