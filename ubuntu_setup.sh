#!/bin/bash
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
printf "########################\nThis program will set up your Ubuntu-based Linux environment.\nYou'll have an assortment of utilities you may otherwise not have\non a Ubuntu default installation. This will take a few minutes as\nUbuntu does it's silly thing, but we'll be back up and \nrunning before you know it.\n\n	Press any key to get started.\n########################\n"
read -n 1 -s ## wait for keystroke to continue
echo "First, we'll grab an essential utility, and update the repositories."
## Installer for ukuu, a kernel version utility
if ! [ -x "$(command -v ukuu)" ]; then
	echo "Installing ukuu..."
	apt-add-repository -y ppa:teejee2008/ppa
	apt -qq update
	apt -qq install ukuu > /dev/null
fi
## Finish ukuu

echo "Updating repository and upgrading packages..."
apt -qq update && apt -qq upgrade ## Finished preloader stuff.

echo "Now, we can install some new programs."
echo "Remember that when you install a new Linux kernel, you will have to reboot your system!!"
echo "Press any key to continue."
read -n 1 -s ## wait for keystroke to continue

echo "Next, we're going to install some essential programs."
if ! [ -x "$(command -v neofetch)" ]; then ##   Neofetch, CLI utility to display system info
    echo "neofetch isn't installed. Let's fix that."
    apt -qq install neofetch > /dev/null
fi
if ! [ -x "$(command -v vlc)" ]; then ##    VLC, media player
    echo "VLC isn't installed. Let's fix that."
    apt -qq install vlc > /dev/null
fi
if ! [ -x "$(command -v git)" ]; then ##    Git, for repository management
    echo "Git isn't installed. Let's fix that."
    apt -qq install git > /dev/null
fi
if ! [ -x "$(command -v snap)" ]; then ##   Snap, Ubuntu's new package system.
    echo "You can't install snap packages right now. Let's fix that."
    apt -qq install snapd-xdg-open > /dev/null
fi
if ! [ -x "$(command -v telegram-desktop)"]; then ##	Telegram, messaging service
    echo "Telegram isn't installed. Let's fix that."
    apt -qq install telegram-desktop > /dev/null
fi 
if ! [ -x "$(command -v atom)"]; then ##	Atom, text editor
    echo "Atom isn't installed. Let's fix that."
    curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list
    apt -qq update > /dev/null
    apt install atom
fi
if ! [ -x "$(command -v geany)"]; then ##  	Geany
    echo "Geany isn't installed. Let's fix that."
    apt -qq install geany > /dev/null
fi
if ! [ -x "$(command -v emacs)"]; then ##  	Emacs
    echo "emacs isn't installed. Let's fix that."
    apt -qq install emacs > /dev/null
fi
if ! [ -x "$(command -v pandoc)"]; then ##  	pandoc
    echo "pandoc isn't installed. Let's fix that."
    apt -qq install pandoc > /dev/null
fi
if ! [ -x "$(command -v ffmpeg)"]; then ##  	ffmpeg
    echo "ffmpeg isn't installed. Let's fix that."
    apt -qq install ffmpeg youtube-dl > /dev/null
fi
##  Wine
##  DXVK
##  Steam
if ! [ -x "$(command -v cmus)" ]; then ## cmus, CLI music player
    echo "cmus isn't installed. Let's fix that."
    apt -qq install cmus > /dev/null
fi
if ! [ -x "$(command -v discord)" ]; then ## Discord, chat program
    echo "Discord isn't installed. Let's fix that."
    snap install discord > /dev/null
fi
printf "All done!\n"
exit 0
