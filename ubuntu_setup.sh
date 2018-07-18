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
	apt-get -qq update
	apt-get -qq install ukuu > /dev/null
fi
## Finish ukuu

echo "Updating repository and upgrading packages..."
apt-get -qq update && apt-get -qq upgrade ## Finished preloader stuff.

printf "########################\nNow, we can install some new programs.\n"
printf "Remember that when you install a new Linux kernel,\nyou will have to reboot your system!!"
printf "\n\nPress any key to continue.\n########################\n"
read -n 1 -s ## wait for keystroke to continue

echo "Next, we're going to install some essential programs."
printf "\n\nPress any key to continue.\n"
read -n 1 -s ## wait for keystroke to continue

if ! [ -x "$(command -v neofetch)" ]; then ##   Neofetch, CLI utility to display system info
    echo "neofetch isn't installed. Let's fix that."
    apt-get -qq install neofetch
fi
if ! [ -x "$(command -v vlc)" ]; then ##    VLC, media player
    echo "VLC isn't installed. Let's fix that."
    apt-get -qq install vlc
fi
if ! [ -x "$(command -v git)" ]; then ##    Git, for repository management
    echo "Git isn't installed. Let's fix that."
    apt-get -qq install git
fi
if ! [ -x "$(command -v snap)" ]; then ##   Snap, Ubuntu's new package system.
    echo "You can't install snap packages right now. Let's fix that."
    apt-get -qq install snapd-xdg-open
fi
if ! [ -x "$(command -v telegram-desktop)"]; then ##	Telegram, messaging service
    echo "Telegram isn't installed. Let's fix that."
    apt-get -qq install telegram-desktop
fi
if ! [ -x "$(command -v atom)"]; then ##	Atom, text editor
    echo "Atom isn't installed. Let's fix that."
    curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list
    apt-get -qq update
    apt-get -qq install atom
fi
if ! [ -x "$(command -v geany)"]; then ##  	Geany
    echo "Geany isn't installed. Let's fix that."
    apt-get -qq install geany
fi
if ! [ -x "$(command -v emacs)"]; then ##  	Emacs
    echo "emacs isn't installed. Let's fix that."
    apt-get -qq install emacs
fi
if ! [ -x "$(command -v pandoc)"]; then ##  	pandoc
    echo "pandoc isn't installed. Let's fix that."
    apt-get -qq install pandoc
fi
if ! [ -x "$(command -v ffmpeg)"]; then ##  	ffmpeg
    echo "ffmpeg isn't installed. Let's fix that."
    apt-get -qq install ffmpeg youtube-dl
fi

if ! [ -x "$(command -v steam)" ]; then ## Steam, gaming platform
    echo "steam isn't installed. Let's fix that."
    apt-get -qq install steam
fi
if ! [ -x "$(command -v cmus)" ]; then ## cmus, CLI music player
    echo "cmus isn't installed. Let's fix that."
    apt-get -qq install cmus
fi
if ! [ -x "$(command -v discord)" ]; then ## Discord, chat program
    echo "Discord isn't installed. Let's fix that."
    snap install discord
fi
if ! [ -x "$(command -v zsh)" ]; then ##	install zsh, a replacement for bash
    echo "You don't have zsh. Let's fix that."
    apt-get -qq install zsh
fi

###############################################################
#### These programs are a little more involved, ###############
#### and require more effort.       ###########################
###############################################################

echo "Installing wine..."
dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/Release.key
apt-key add Release.key
apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
apt-get -qq install --install-recommends winehq-stable
clear

echo "Installing vulkan, and updating GPU drivers..."
apt install libvulkan1 libvulkan-dev vulkan-utils
add-apt-repository ppa:graphics-drivers/ppa
apt update && apt upgrade
apt install vulkan

printf "\nYou want to install Lutris and DXVK at a future time, all things considered.\nBut because it is not a necessity in this script, it has been excluded.\n\n"

###############################################################
#### Doing some configuration work. ###########################
###############################################################

echo "Downloading default wallpaper..."
mkdir -p ~/Pictures/Wallpapers ##create default Wallpaper directory
wget https://raw.githubusercontent.com/AsamiT/dotfiles/master/georgeVI.png -O ~/Pictures/Wallpapers/georgeVI.png ##retrieve default wallpaper
gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/Pictures/Wallpapers/georgeVI.png ##apply
echo "done."

if [ -x "$(command -v zsh)" ]; then ##	install oh-my-zsh!
	echo "zsh" >> /etc/shells
	chsh -s $(which zsh)
	curl -fsSL 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
	## we're going to add a portion that clones and copies zshrc from my dotfiles git repo to the ~ directory.
fi

printf "All done!\n"
exit 0
