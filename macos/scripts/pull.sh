#!/bin/bash

find ~/Git\ Repos/. -maxdepth 1  -type d \( ! -name . \) -print0 | xargs -0 -L1 sh -c 'cd "$0" && pwd && git pull'

