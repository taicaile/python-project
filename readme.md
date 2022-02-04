# README
<!-- markdownlint-disable line-length -->

This repo is used to initialize an environment for Python project.

## Usage

To initialize a Python project,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/setup.sh | bash
```

To install a virtual environment for a Python project,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/view.sh | bash
```

To install Python3,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/python3.sh | bash
```

To install `markdownlint`,

First, install the `npm` lts version via `nvm`,

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
nvm use --lts
```

Then, install the required package,

```bash
npm install -g markdownlint-cli
```
