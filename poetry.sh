#!/usr/bin/bash

# install poetry
pip install -q poetry -U

# update config
poetry config virtualenvs.in-project true
