#!/bin/bash

packages = (
  "task-japanese"
  "task-japanese-desktop"
  "fcitx5-mozc"
  "cargo"
  "gobuster"
  "z"
  "fzf"
)

#change font
wget -P /tmp https://moji.or.jp/wp-content/ipafont/IPAexfont/ipaexg00401.zip
unzip /tmp/ipaexg00401.zip

#install VirutalBox
VirtualBox-Packages = (
  "linux-headers-generic"
  "virtualbox"
)

#fcitx5 Theme
git clone https://github.com/waleslau/fcitx5-themes.git /tmp/fcitx5-themes
mkdir -p ~/.local/share/fcitx5/themes
mv /tmp/fcitx5-themes/Alpha-black ~/.local/share/fcitx5/themes

#locale setting
dpkg-reconfigure locales
update-locale LANG=ja_JP.UTF-8

#install z command
git clone https://github.com/rupa/z.git ~/.z
echo ". ~/.z/z.sh" >> ~/.bash_profile

#setting fzf 
echo "source /usr/share/doc/fzf/examples/key-bindings.zsh" >> ~/.zshrc
echo "source /usr/share/doc/fzf/examples/completion.zsh" >> ~/.zshrc

#install rustscan
cargo install rustscan

