#!/bin/bash

# This script is used to setup a local environment for Python3 development

set -e

function assert_installed {
    # if ! apt -qq list "$1" --installed 2>/dev/null | grep -qE "(installed|upgradeable)";  then
    if ! command -v "$1" &>/dev/null; then
        echo " $1 is not installed, please install it, exit..."
        exit 1
    fi
}

function is_installed {
    command -v "$1" &>/dev/null
}

# Check if required programs are installed

PRE_INSTALLS=("direnv")
for program in "${PRE_INSTALLS[@]}"; do
    assert_installed "$program"
done

FILES=(".envrc")
for FILE in "${FILES[@]}"; do
    if [[ ! -f "$FILE" ]]; then
        ENVRC_URL=https://raw.githubusercontent.com/taicaile/pyproject/master/$FILE
        wget -qO "$FILE" "$ENVRC_URL" || {
            echo "download failed, kindly check your network or the link: $ENVRC_URL"
            exit 1
        }
    fi
done

# run direnv
direnv allow
