
HOME_ROOT="/home/deo"
GIT_NAME="Andrey Starkov"
GIT_EMAIL="im@andreystarkov"

figlet -c 'perfect dev'
figlet -c -f small 'extremely sexy'

echo 'Installing git...'
sudo apt-get install git git-gui kdiff3 -yqq > /dev/null
echo 'Installing nodejs...'
sudo apt-get install nodejs npm build-essential libssl-dev -yqq > /dev/null
echo 'Installing nvm...'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

echo 'Installing zsh...'
sudo apt-get install zsh -yqq > /dev/null
echo 'Installing guake...'
sudo apt-get install guake -yqq > /dev/null

echo 'Installing sexy ZSH enviroment...'
sudo apt-get install stow -yqq > /dev/null
cd ~
echo 'Installing zgen...'
git clone https://github.com/tarjoilija/zgen > /dev/null
cp -rf ~/zgen ~/.zgen

echo 'Installing ZSH Quickstart Kit (oh-my-zsh & other good stuff)...'
git clone https://github.com/unixorn/zsh-quickstart-kit > /dev/null
cd zsh-quickstart-kit
stow --target=${HOME_ROOT} zsh
cd ~

echo 'Setting up git...'
git config --global user.name $GIT_NAME
git config --global user.email $GIT_EMAIL
git config --global merge.tool kdiff3
git config --global mergetool.keepBackup false

echo 'Installing Atom...'
sudo apt-get install atom -yqq > /dev/null
