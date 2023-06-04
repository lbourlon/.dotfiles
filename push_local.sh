#!/bin/bash

alac=.config/alacritty/
kitt=.config/kitty/
nvim=.config/nvim/
zsh_=.zshrc

mkdir -p ~/$alac && mkdir -p ~/$kitt && mkdir -p ~/$nvim
rm -rf   ~/$alac && rm -rf   ~/$kitt && rm -rf   ~/$nvim
rm ~/$zsh_

cp -r ./$kitt ~/$kitt
cp -r ./$alac ~/$alac
cp      $zsh_ ~/$zsh_
cp -r ./$nvim ~/$nvim
