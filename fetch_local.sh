#!/bin/bash


alacritty_path=$HOME/.config/alacritty/
nvim_path=$HOME/.config/nvim/
zsh_path=$HOME/./.zshrc

rm -r files/*
mkdir -p files

cp -r $nvim_path files
cp -r $alacritty_path files
cp -r $zsh_path files
