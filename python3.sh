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

function help {
  echo "usage:"
  echo "./python3.sh       ,without argument, the default python3 will be installed."
  echo "./python3.sh  3.8  , the python3.8 will be installed."

}

# check installled Python version
# -------------------------
info "The following versions of Python are installed in this machine:"
for p in $(find /usr/bin/python* | grep -P 'python[\d](.[\d])?+$'); do
  info "$p" "$($p --version)"
done

# check the input arguments, it shall be one argument or none.
if [ $# -gt 1 ]; then
  error "wrong arguments"
  help
fi

PYTHON3_VERSION=python${1:-"3"}
# check if the desired python version exists
if ! apt-cache show "$PYTHON3_VERSION" &>/dev/null; then
  error "no package found for $PYTHON3_VERSION"
fi

info "Now going to install $PYTHON3_VERSION"

# install python3-pip, python3-venv, python3-dev
# ----------------------------------------------
info "install python3"
sudo apt -q install -y --no-install-recommends \
  "$PYTHON3_VERSION" \
  "$PYTHON3_VERSION-distutils" \
  "$PYTHON3_VERSION-venv" \
  "$PYTHON3_VERSION-dev"

info "update the python3 symlink"
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/"$PYTHON3_VERSION" 1
sudo update-alternatives --set python3 /usr/bin/"$PYTHON3_VERSION"

sudo apt install python3-pip

# check installled Python version
# -------------------------
info "The following versions of Python are installed in this machine:"
for p in $(find /usr/bin/python* | grep -P 'python[\d](.[\d])?+$'); do
  info "$p" "$($p --version)"
done

info "the python3 version is $(python3 --version)"
