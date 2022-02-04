#!/usr/bin/bash

info() {
  printf '\E[32m'
  echo "$@"
  printf '\E[0m'
}

error() {
  printf '\E[31m'
  echo "$@"
  printf '\E[0m'
}

# check installled Python version
# -------------------------
info "The following versions of Python are installed in this machine:"
for p in $(find /usr/bin/python* | grep -P 'python[\d](.[\d])?+$'); do
  info "$p" "$($p --version)"
done

# install python3-pip, python3-venv, python3-dev
# ----------------------------------------------
apt -q install -y --no-install-recommends \
  python3 \
  python3-dev \
  python3-venv \
  python3-pip

# check installled Python version
# -------------------------
info "The following versions of Python are installed in this machine:"
for p in $(find /usr/bin/python* | grep -P 'python[\d](.[\d])?+$'); do
  info "$p" "$($p --version)"
done
