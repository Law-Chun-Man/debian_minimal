#!/bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

# base packages
xdg-user-dirs-update
sudo apt -y install git
sudo apt -y install xorg
sudo apt -y install xserver-xorg
sudo apt -y install xinput
sudo apt -y install build-essential
sudo apt -y install make

# display manager
sudo apt -y install lightdm
sudo systemctl enable lightdm
sudo rm /usr/share/xsessions/lightdm-xsession.desktop

# git clone config
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/Law-Chun-Man/suckless/
cd

# dwm
sudo apt -y install libx11-dev
sudo apt -y install libxinerama-dev
sudo apt -y install libxft-dev

mv ~/.config/suckless/dwm/ ~/.config/dwm/
cd ~/.config/dwm/
rm -rf .git/
sed -i "s/username/$USER/g" config.def.h
sudo make clean install
cd ~/.config/dwm/bash_scripts/
chmod +x *
cd ~/.config/dwm/dunst/
chmod +x *.sh
cd

cat > temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Exec=dwm
Icon=dwm
Type=XSession
EOF
sudo cp temp /usr/share/xsessions/dwm.desktop
rm temp

# st
sudo apt -y install libharfbuzz-dev

mv ~/.config/suckless/st/ ~/.config/st/
cd ~/.config/st/
rm -rf .git/
sudo make clean install
cd

# for dmenu
mv ~/.config/suckless/dmenu/ ~/.config/dmenu/
cd ~/.config/dmenu/
rm -rf .git/
sudo make clean install
cd

# for slock
sudo apt -y install libxrandr-dev

mv ~/.config/suckless/slock/ ~/.config/slock/
cd ~/.config/slock/
rm -rf .git/
sudo make clean install
cd

# remove folder
rm -rf ~/.config/suckless/

# other packages
sudo apt -y install lxappearance
sudo apt -y install picom
sudo apt -y install dunst
sudo apt -y install curl
sudo apt -y install playerctl
sudo apt -y install gnome-boxes
sudo apt -y install firefox-esr
sudo apt -y install neovim
sudo apt -y install vifm
sudo apt -y install obs-studio
sudo apt -y install gimp
sudo apt -y install kdenlive
sudo apt -y install pandoc
sudo apt -y install fcitx5
sudo apt -y install fcitx5-chinese-addons
sudo apt -y install fonts-jetbrains-mono
sudo apt -y install fonts-font-awesome
sudo apt -y install texlive-full

# to be checked
sudo apt -y install openvpn
sudo apt -y install zathura
sudo apt -y install mpv
sudo apt -y install mpv-mpris
sudo apt -y install nsxiv
sudo apt -y install libreoffice
sudo apt -y install clangd
sudo apt -y install tlp
sudo apt -y install policykit-1-gnome
sudo apt -y install network-manager-gnome
sudo apt -y install pulsemixer
sudo apt -y install htop
sudo apt -y install python3-pypdf2
sudo apt -y install python3-matplotlib
sudo apt -y install python3-numpy
sudo apt -y install python3-scipy
sudo apt -y install python3-sympy
sudo apt -y install python3.11-venv
sudo apt -y install python3-pip
sudo apt -y install python3-pylsp
sudo apt -y install xss-lock
sudo apt -y install thunar

# finalise
sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
