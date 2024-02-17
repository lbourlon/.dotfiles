#!/bin/bash

kitty=$HOME/.config/kitty/
tmux=$HOME/.config/tmux/
nvim=$HOME/.config/nvim/
zsh=$HOME/.zshrc

gdb=$HOME/.gdbinit

folder=.config

rm -r $folder
mkdir -p $folder

cp -r $nvim $folder
cp -r $kitty $folder
cp $zsh ./
cp -r $tmux $folder
