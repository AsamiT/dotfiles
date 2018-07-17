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
if ! [ -x "$(command -v neofetch)" ]; then
    echo "Neofetch isn't installed. Installing."
    apt install neofetch
fi
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
