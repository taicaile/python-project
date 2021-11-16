# README
<!-- markdownlint-disable line-length -->

This repo is used to initialize an environment for Python project.

## Usage

To initialize a Python project,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/setup.sh | bash
```

To initialize development environment in a container,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/pyproject/master/dev-init.sh | bash
```

```text
# dev-init.sh TODO
- add argument, --upgrade/-U,
- add argument, --python 3.8, if install specific Python version
- add prefix option for bash prompt
```

To install markdownlint,

```bash
sudo npm install -g markdownlint-cli
```

```text
# TODO

- config for all users, including root.

```
