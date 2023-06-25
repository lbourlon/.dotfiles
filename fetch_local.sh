#!/bin/bash

alacritty=$HOME/.config/alacritty/
kitty=$HOME/.config/kitty/
nvim=$HOME/.config/nvim/
zsh=$HOME/.zshrc
gdb=$HOME/.gdbinit

folder=.config

rm -r $folder
mkdir -p $folder

cp -r $nvim $folder
cp -r $alacritty $folder
cp -r $kitty $folder
cp -r $zsh $folder
