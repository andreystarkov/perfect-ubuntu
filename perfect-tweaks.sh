figlet -c 'perfect tweaks'
figlet -c -f small 'smoothy'

echo 'Disabling guest session...'
sudo sh -c "echo 'allow-guest=false' >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf"

echo 'Enabling minimize on click...'
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

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
