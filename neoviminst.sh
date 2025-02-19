#!/bin/bash
sudo apt-get install -y \
	ninja-build \
	gettext libtool libtool-bin \
	autoconf automake cmake g++ \
	pkg-config unzip
cd ~/
git clone https://github.com/neovim/neovim.git

cd neovim
git checkout stable
sudo make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr/local install
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

sudo apt install -y npm xclip
git clone https://github.com/jamesonhm/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

