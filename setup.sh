#!/bin/bash

# This script is used to setup a local environment for Python3 development

set -e

function assert_installed {
    # if ! apt -qq list "$1" --installed 2>/dev/null | grep -qE "(installed|upgradeable)";  then
    if ! command -v "$1" &>/dev/null;  then
        echo " $1 is not installed, please install it, exit..."
        exit 1
    fi
}

# Check if required programs are installed

PRE_INSTALLS=("direnv" "git" "markdownlint" "shellcheck" "pre-commit")
for program in "${PRE_INSTALLS[@]}"; do
  assert_installed "$program"
done

# install npm tools
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt -q install -y nodejs
npm install -g --quiet --no-progress markdownlint-cli

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

# pre-commit
pre-commit install
