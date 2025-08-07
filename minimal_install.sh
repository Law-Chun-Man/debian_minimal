#!/bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

# base packages
base_packages=(
    git
    xorg
    xserver-xorg
    xinput
    build-essential
    make
    lightdm
)

sudo apt -y install "${base_packages[@]}"

# display manager
sudo systemctl enable lightdm
sudo rm /usr/share/xsessions/lightdm-xsession.desktop

# git clone config
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/Law-Chun-Man/suckless/
cd

# dwm
sudo apt -y install libx11-dev libxinerama-dev libxft-dev

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

# remove folder
rm -rf ~/.config/suckless/

# other packages
other_packages=(
    lxappearance
    picom
    dunst
    curl
    playerctl
    gnome-boxes
    firefox-esr
    neovim
    vifm
    obs-studio
    gimp
    kdenlive
    pandoc
    fcitx5
    fcitx5-chinese-addons
    fonts-jetbrains-mono
    fonts-font-awesome
    texlive-full
    openvpn
    zathura
    mpv
    mpv-mpris
    nsxiv
    libreoffice
    clangd
    tlp
    policykit-1-gnome
    network-manager-gnome
    pulsemixer
    htop
    python3-pypdf2
    python3-matplotlib
    python3-numpy
    python3-scipy
    python3-sympy
    python3.11-venv
    python3-pip
    python3-pylsp
    xss-lock
    light-locker
    thunar
    thunar-archive-plugin
)

sudo apt -y install "${other_packages[@]}"

#firewall
sudo apt -y install ufw
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw enable

# finalise
sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
xdg-user-dirs-update
