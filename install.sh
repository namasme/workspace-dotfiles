#!/usr/bin/env bash

LOGFILE="/home/bits/install.log"

bash /home/bits/dotfiles/install_0.sh 2>&1 | tee -a "$LOGFILE"
