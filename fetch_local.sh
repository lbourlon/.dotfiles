#!/bin/bash

alacritty=.config/alacritty
nvim=.config/nvim 
zsh=./.zshrc

mkdir -p files/$alacritty
mkdir -p files/$nvim

cp -r $HOME/$nvim files/$nvim/../
cp -r $HOME/$alacritty files/$alacritty/../
cp -r $HOME/$zsh files/$zsh
