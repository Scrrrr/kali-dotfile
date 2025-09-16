#!/bin/bash

packages=(
  "task-japanese"
  "task-japanese-desktop"
  "fcitx5-mozc"
  "cargo"
  "gobuster"
  "z"
  "fzf"
  "nvim"
  "feroxbuster"
  "chisel"
)

apt update -y
apt upgrade -y

for list in ${packages[@]}; do
    apt install -y ${list}
done

# fcitx5のテーマ
git clone https://github.com/waleslau/fcitx5-themes.git /tmp/fcitx5-themes
mkdir -p ~/.local/share/fcitx5/themes
mv /tmp/fcitx5-themes/Alpha-black ~/.local/share/fcitx5/themes

#ローカルの設定
dpkg-reconfigure locales
update-locale LANG=ja_JP.UTF-8

# キーボード配列の変更
localectl set-keymap us
localectl set-x11-keymap us

#install z command
git clone https://github.com/rupa/z.git ~/.z
echo ". ~/.z/z.sh" >> ~/.bash_profile

#setting fzf 
echo "source /usr/share/doc/fzf/examples/key-bindings.zsh" >> ~/.zshrc
echo "source /usr/share/doc/fzf/examples/completion.zsh" >> ~/.zshrc
echo "export PATH="$HOME/.cargo/bin:$PATH" >> ~/.zshrc

#install rustscan
cargo install rustscan

