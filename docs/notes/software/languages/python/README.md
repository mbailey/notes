---
alias: Python
---
# Python

- [Pip](pip/README.md)
- [pipx](pip/pipx.md)
- [README](pyenv/README.md)
- [pypi](./pypi.md)
- [poetry](poetry.md)
- [ensure-venv-loaded](venv/ensure-venv-loaded.md)

- [When to use python3](When%20to%20use%20python3.md)
- [where-to-find-function-docs](where-to-find-function-docs.md)

## Commands

- **Execute a local file:** `python -m aider.voice`
-  **Run http server:** `python3 -m http.server`


## Create Virtual Env

```shell
python -m venv venv
source venv/bin/activate
```

## Idioms

### `res`
```python
res = some_function()
matching_commands, first_word, rest_inp = res
```

