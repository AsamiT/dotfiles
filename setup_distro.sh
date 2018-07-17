#!/bin/bash
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
printf "This script will set up Ubuntu Linux for my personal consumption. It will add programs and all that jazz.\n"
