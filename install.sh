#!/bin/sh

# For i3
# i3-wm polybar blueman lxappearance xrandr picom feh pavucontrol brightnessctl flameshot i3lock xss-lock
# xserver-xorg-input-synaptics 

# Sway
apt install sway swayidle swaylock waybar wl-clipboard xdg-desktop-portal-wlr flameshot xdg-desktop-portal
apt dunst blueman-applet playerctl
# nm-applet 
apt install pipewire xdg-desktop-portal xdg-desktop-portal-wlr
qt5-wayland qt5ct

# gambas3-gb-qt5-waylandl

# Others 
# neovim tmux fzf bat ripgrep eza ranger

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#sudo apt update
#sudo apt install neovim spice-vdagent kitty

#wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
#sha256sum nvim-linux64.tar.gz| grep dbf4eae83647ca5c3ce1cd86939542a7b6ae49cd78884f3b4236f4f248e5d447
#tar xzvf nvim-linux64.tar.gz
#sudo cp ./nvim-linux64/bin/nvim /bin/nvim

# Prompt for these and replace
# git config --global user.name ""
# git config --global user.email ""

git config --global pager.log false
