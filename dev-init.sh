#!/usr/bin/env bash

# This script is used to initialize container envrionment for Python project development.

set -e

info() {
  printf '\E[32m'; echo "$@"; printf '\E[0m'
}


error() {
  printf '\E[31m'; echo "$@"; printf '\E[0m'
}

# -------------------------
if [[ $EUID -ne 0 ]]; then # root user
    error "Please run this script as the root user."
    exit 1
fi

# -------------------------
info "update && upgrade"
apt -qq update && apt -qq upgrade -y

# -------------------------
info "install common libraries"
apt -qq install -y \
    sudo \
    curl \
    git \
    tmux \
    nano \
    htop \
    neofetch

# -------------------------
info "install oh my bash"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# -------------------------
info "The following versions of Python are installed in this machine:"
for p in $(find  /usr/bin/python* | grep -P 'python[\d](.[\d])?+$')
do
  echo "$p" "$($p --version)"
done
