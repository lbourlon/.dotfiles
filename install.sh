#!/bin/sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt update
sudo apt install neovim spice-vdagent kitty

wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz
sha256sum nvim-linux64.tar.gz| grep 6c083017304213c3a3efde8d332a52231b8df8206d35146942097c303ebf93d5
tar xzvf nvim-linux64.tar.gz
sudo cp ./nvim-linux64/bin/nvim /bin/nvim
