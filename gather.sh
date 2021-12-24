#!/bin/zsh

function _pth_check() {
  if [ ! -d "$1" ]; then
    echo "  Creating directory $1"
    mkdir "$1"
  fi
}

pth=${0:a:h}
confpth=$XDG_CONFIG_HOME
if [ $confpth = '' ]; then confpth="$HOME/.config/"; fi

#
#         ATOM
#
echo 'Gathering atom config...'
_pth_check "$pth/Atom"
_pth_check "$pth/.atom"
cp "$confpth/Atom/Preferences" "$pth/Atom/"
cp "$HOME/.atom/*.cson" "$pth/.atom/"

#
#         DUNST
#
echo 'Gathering dunst config...'
cp "$confpth/dunst/" "$pth/" -r

#
#         I3
#
echo 'Gathering i3 config...'
cp "$confpth/i3/" "$pth/" -r

#
#         KITTY
#
echo 'Gathering kitty config...'
cp "$confpth/kitty/" "$pth/" -r

#
#         KVANTUM
#
echo 'Gathering Kvantum config...'
cp "$confpth/Kvantum" "$pth/" -r

