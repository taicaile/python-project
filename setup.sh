#!/bin/bash

# This script is used to setup a local environment for Python3 development

# config direnv

# Check if direnv is installed, try to install direnv if not installed yet
DIRENV=direnv
apt -qq list $DIRENV 2>/dev/null | grep -qE "(installed|upgradeable)" || apt -qq install $DIRENV || echo "Pelase install $DIRENV manually."
exit 1

# check ~/.bashrc
BASHRC=~/.bashrc
DIRENV_HOOK_LINE="eval "$(direnv hook bash)""
grep -qF -- "$DIRENV_HOOK_LINE" "$BASHRC" || echo "$DIRENV_HOOK_LINE" >>"$BASHRC"
source BASHRC

# download .envrc file
ENVRC=.envrc
if [[ ! -f "$ENVRC" ]]; then
    ENVRC_URL=https://raw.githubusercontent.com/taicaile/pyproject/master/.envrc
    wget -O $ENVRC $ENVRC_URL || echo "download failed, kindly check your network or the link: $ENVRC_URL" && exit 1
fi

direnv allow
