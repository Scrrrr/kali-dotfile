#!/bin/bash

packages=(
  "task-japanese"
  "task-japanese-desktop"
  "fcitx5-mozc"
  "cargo"
  "gobuster"
  "z"
  "fzf"
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
mkdir -p /home/kali/.local/share/fcitx5/themes
mv /tmp/fcitx5-themes/Alpha-black /home/kali/.local/share/fcitx5/themes

#ローカルの設定
dpkg-reconfigure locales
update-locale LANG=ja_JP.UTF-8

# キーボード配列の変更
localectl set-keymap us
localectl set-x11-keymap us

#install z command
git clone https://github.com/rupa/z.git /home/kali/.z
echo ". /home/kali/.z/z.sh" >> /home/kali/.bash_profile

#setting fzf 
echo "source /usr/share/doc/fzf/examples/key-bindings.zsh" >> /home/kali/.zshrc
echo "source /usr/share/doc/fzf/examples/completion.zsh" >> /home/kali/.zshrc
echo "export PATH="$HOME/.cargo/bin:$PATH" >> /home/kali/.zshrc

#install rustscan
cargo install rustscan

