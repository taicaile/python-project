#!/bin/bash

# This script is used to setup a local environment for Python3 development

# config direnv

# Check if direnv is installed, try to install direnv if not installed yet
DIRENV=direnv
apt -qq list $DIRENV 2>/dev/null | grep -qE "(installed|upgradeable)" || apt -qq install $DIRENV || {
    echo "Pelase install $DIRENV manually."
    exit 1
}

# check ~/.bashrc
BASHRC=~/.bashrc
DIRENV_HOOK_LINE="eval \"$(direnv hook bash)\""
grep -qF -- "$DIRENV_HOOK_LINE" "$BASHRC" || {
    echo "$DIRENV_HOOK_LINE" >>"$BASHRC"
    # shellcheck disable=SC1090
    source $BASHRC
}

FILES=(".envrc" ".pre-commit-config.yaml" "pyproject.toml")
for FILE in "${FILES[@]}"; do
    if [[ ! -f "$FILE" ]]; then
        ENVRC_URL=https://raw.githubusercontent.com/taicaile/pyproject/master/$FILE
        wget -O "$FILE"  "$ENVRC_URL" || {
            echo "download failed, kindly check your network or the link: $ENVRC_URL"
            exit 1
        }
    fi
done

direnv allow
