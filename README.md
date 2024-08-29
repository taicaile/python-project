# README

This repo is used to initialize an environment for Python project.

## Usage

To initialize a virtual environment for a Python project development,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/setup.sh | bash
```

To create a virtual environment for having a glance at a Python project,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/view.sh | bash
```

To install Python3 on Ubuntu system,

```bash
# install the default python3
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/python3.sh | sudo bash
# specify the python3 version
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/python3.sh | sudo bash -s -- 3.8
```

To install `markdownlint`:

First, install the `npm` LTS version via `nvm`,

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
nvm use --lts
```

Then, install the required package,

```bash
npm install -g markdownlint-cli
```

## Development

Python package manager: `uv`
