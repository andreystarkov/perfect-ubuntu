figlet -c 'perfect tweaks'
figlet -c -f small 'smoothy'

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

# remove dots at login screen
#
# sudo xhost +SI:localuser:lightdm
# sudo su lightdm -s /bin/bash
# gsettings set com.canonical.unity-greeter draw-grid false;exit
