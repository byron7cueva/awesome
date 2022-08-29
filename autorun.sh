#!/usr/bin/env bash

export KDEWM=/usr/bin/awesome
export QT_QPA_PLATFORMTHEME=qt5ct

function run {
  if (command -v $1 && ! pgrep $1); then
    $@&
  fi
}

if (command -v gnome-keyring-daemon && ! pgrep gnome-keyring-d); then
     gnome-keyring-daemon --daemonize --login &
fi

if (command -v xfce4-power-manager && ! pgrep xfce4-power-man) ; then
     xfce4-power-manager &
fi

run picom --shadow-exclude '!focused'
