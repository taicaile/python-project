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
apt -q update && apt -q upgrade -y

# -------------------------
info "install common libraries"
apt -q install -y --no-install-recommends \
    sudo \
    curl \
    git \
    tmux \
    nano \
    htop \
    neofetch \
    direnv

# -------------------------
USER_HOME=/home/"${SUDO_USER:-$USER}"
BASHRC=$USER_HOME/.bashrc
INIT_SH_PATH="$USER_HOME/init.sh"
wget https://raw.githubusercontent.com/taicaile/init.sh/master/init.sh -O  "$INIT_SH_PATH"

# append this

INIT_HOOK_LINE="source $INIT_SH_PATH"
grep -qF -- "$INIT_HOOK_LINE" "$BASHRC" || {
    echo "$INIT_HOOK_LINE" >>"$BASHRC"
    # shellcheck disable=SC1090
    source "$BASHRC"
}

# -------------------------
info "The following versions of Python are installed in this machine:"
for p in $(find  /usr/bin/python* | grep -P 'python[\d](.[\d])?+$')
do
  echo "$p" "$($p --version)"
done
