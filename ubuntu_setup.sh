#!/bin/bash
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
echo "This program will set up your Ubuntu-based Linux environment, with an assortment of utilities you may otherwise not have on a Ubuntu default installation. This will take a few minutes as Ubuntu does it's silly thing, but we'll be back up and running before you know it. Press any key to get started."
read -n 1 -s
echo "First, let's get the latest updates and upgrades from the repo..."
apt update && apt upgrade
echo "Now, we can install some new programs."
## Installer for ukuu, a kernel version utility
echo "First, we're going to install ukuu, a kernel version utility."
apt-add-repository -y ppa:teejee2008/ppa
apt update
apt install ukuu
## Finished installing ukuu.
echo "Next, we're going to install some essential programs."
if ! [ -x "$(command -v neofetch)" ]; then ##   Neofetch, CLI utility to display system info
    echo "neofetch isn't installed. Let's fix that."
    apt install neofetch
fi
if ! [ -x "$(command -v vlc)" ]; then ##    VLC, media player
    echo "VLC isn't installed. Let's fix that."
    apt install vlc
fi
if ! [ -x "$(command -v git)" ]; then ##    Git, for repository management
    echo "Git isn't installed. Let's fix that."
    apt install git
fi
if ! [ -x "$(command -v snap)" ]; then ##   Snap, Ubuntu's new package system.
    echo "You can't install snap packages right now. Let's fix that."
    apt install snapd-xdg-open
fi
if ! [ -x "$(command -v discord)" ]; then ## Discord, chat program
    echo "Discord isn't installed. Let's fix that."
    snap install discord
fi
##  Telegram
##  Atom
##  Geany
##  Emacs
##  Wine
##  DXVK
##  Steam
if ! [ -x "$(command -v cmus)" ]; then ## cmus, CLI music player
    echo "cmus isn't installed. Let's fix that."
    snap install discord
fi
printf "All done!"
exit 0
