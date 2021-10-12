# Readme

This repo targets to provide a template for Python project.

## Usuage

to create a python venv,

```bash
python3 -m venv venv
source venv/bin/activate
pip install pip wheel -U
pip install pylint isort mypy black pre-commit
```

run mypy

```bash
my .
```

direnv

create .envrc file under project root,

```bash
layout python3
```

then, run the following,

```bash
direnv allow
```
