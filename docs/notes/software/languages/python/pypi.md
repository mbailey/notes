---
alias: PyPI
---
# PyPI - Python Package Index

## bash completion

```shell
pip completion --bash > ~/.pip-completion
echo '. ~/.pip-completion' >> ~/.bashrc
```

### Package versions

**Install specific package version:**  `pip install <package_name>==`

**List package versions:**

```shell
$ pip index versions aider-chat
WARNING: pip index is currently an experimental command. It may be removed/changed in a future release without prior warning.
aider-chat (0.57.1)
Available versions: 0.57.1, 0.57.0, 0.56.0, 0.55.0, 0.54.12, 0.54.11, 0.54.10, 0.54.9, 0.54.8, 0.54.7, 0.54.6, 0.54.5, 0.54.4, 0.54.3, 0.54.2, 0.54.0, 0.53.0, 0.52.1, 0.52.0, 0.51.1, 0.51.0, 0.50.1, 0.50.0, 0.49.1, 0.49.0, 0.48.1, 0.48.0, 0.47.1, 0.47.0, 0.46.1, 0.46.0, 0.45.1, 0.45.0, 0.44.0, 0.43.4, 0.43.3, 0.43.2, 0.43.0, 0.42.0, 0.41.0, 0.40.6, 0.40.5, 0.40.1, 0.40.0, 0.39.0, 0.38.0, 0.37.0, 0.36.0, 0.35.0, 0.34.0, 0.33.0, 0.32.0, 0.31.1, 0.31.0, 0.30.1, 0.30.0, 0.29.2, 0.29.1, 0.29.0, 0.28.0, 0.27.0, 0.26.1, 0.26.0, 0.25.0, 0.24.1, 0.24.0, 0.23.0, 0.22.0, 0.21.1, 0.21.0, 0.16.0, 0.15.0, 0.14.2, 0.14.1, 0.14.0, 0.13.0
  INSTALLED: 0.57.1
  LATEST:    0.57.1
```