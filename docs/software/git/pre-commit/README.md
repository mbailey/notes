---
alias: pre-commit
---
# pre-commit

Python tool for managing git pre-commit hooks

- https://pre-commit.com/

## Usage

### Install pre-commit into your repo's git hooks

- Do this whenever on any checked out repo where you want pre-commit to run on every commit.
```shell
 pre-commit install
```

**Run manually**:
```shell
pre-commit run --all-files
```

**Output from failing git commit**:
```
> git -c user.useConfigOnly=true commit --quiet --allow-empty-message --file - -S
check for added large files..............................................Passed
Markdown Link Check......................................................Failed
- hook id: markdown-link-check
- exit code: 1

ERROR: 1 dead links found in personal/Daily/2024-01/2024-01-30-Tue.md !
  [✖] ../tasks/summary.md → Status: 400
```

## Install

```bash
pip install --upgrade identify
pip install --upgrade pre-commit
```

**Shell completion script**: [Takishima/pre-commit-completion Bash completion for pre-commit with hook id completion provided based on the `rapidyaml` , `c4core` and `c4fs` libraries (github.com)](https://github.com/Takishima/pre-commit-completion)
## Configure

### Add .pre-commit-config.yaml to git repo



### Setup the git hook scripts

```shell
pre-commit install
```


### Lock external hooks to a specific version (git sha) with:

```shell
pre-commit autoupdate --freeze
```

### Testing

```shell
rm -fr .git && git init && git-config-personal && pre-commit install && git add . && git commit
```

## Resources

### Hooks

- [pre-commit How to create hooks for unsupported tools - Adam Johnson (adamj.eu)](https://adamj.eu/tech/2023/02/09/pre-commit-hooks-unsupported-tools/)