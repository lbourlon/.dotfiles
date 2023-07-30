#!/bin/bash

alacritty=$HOME/.config/alacritty/
kitty=$HOME/.config/kitty/
tmux=$HOME/.config/tmux/
nvim=$HOME/.config/nvim/
zsh=$HOME/.zshrc
pbin=$HOME/.config/bin/

gdb=$HOME/.gdbinit

folder=.config

rm -r $folder
mkdir -p $folder

cp -r $nvim $folder
cp -r $alacritty $folder
cp -r $kitty $folder
cp -r $zsh $folder
cp -r $tmux $folder
cp -r $pbin $folder
