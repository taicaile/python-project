#!/bin/bash

# This script is used to setup a local environment for Python3 development

set -e

function assert_installed {
    if ! apt -qq list "$1" --installed 2>/dev/null | grep -qE "(installed|upgradeable)";  then
        echo " $1 is not installed, please install it, exit..."
        exit 1
    fi
}

# Check if direnv is installed, try to install direnv if not installed yet
DIRENV=direnv
assert_installed $DIRENV

# check if git is installed
GIT=git
assert_installed $GIT

FILES=(".envrc" ".pre-commit-config.yaml" "pyproject.toml" ".gitignore")
for FILE in "${FILES[@]}"; do
    if [[ ! -f "$FILE" ]]; then
        ENVRC_URL=https://raw.githubusercontent.com/taicaile/pyproject/master/$FILE
        wget -qO "$FILE"  "$ENVRC_URL" || {
            echo "download failed, kindly check your network or the link: $ENVRC_URL"
            exit 1
        }
    fi
done

# init repo
if [ ! -d .git ]; then
  git init
fi

# run direnv
direnv allow
