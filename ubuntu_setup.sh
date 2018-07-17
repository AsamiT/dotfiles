#!/bin/bash
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
echo "This program will set up your Ubuntu-based Linux environment to your liking, Robin."
if ! [ -x "$(command -v neofetch)" ]; then
    echo "Neofetch isn't installed. Installing."
    apt install neofetch
if ! [ -x "$(command -v vlc)" ]; then
    echo "VLC not installed. Installing..."
    apt install vlc
fi
if ! [ -x "$(command -v git)" ]; then
    echo "Git not installed. Installing..."
    apt install git
fi
if ! [ -x "$(command -v snap)" ]; then
    echo "You can't install snap packages right now. Let's fix that."
    apt install snapd-xdg-open
fi
if ! [ -x "$(command -v discord)" ]; then
    echo "Discord isn't installed. Let's fix that."
    snap install discord
fi
printf "All done!"
exit 0
