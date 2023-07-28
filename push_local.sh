#!/bin/bash

alac=.config/alacritty/
kitt=.config/kitty/
nvim=.config/nvim/
bin=.config/bin/
tmux=.config/tmux/
zsh_=.zshrc

mkdir -p ~/$alac && mkdir -p ~/$kitt && mkdir -p ~/$nvim
mkdir -p ~/$bin && mkdir -p ~/$tmux

rm -rf   ~/$alac && rm -rf   ~/$kitt && rm -rf   ~/$nvim
rm -rf   ~/$bin && rm -rf   ~/$tmux
rm ~/$zsh_

cp -r ./.config/* ~/.config/
cp      $zsh_ ~/$zsh_
