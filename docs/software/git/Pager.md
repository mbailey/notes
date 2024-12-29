---
alias: Git Pager Control
---
# Git Pager Control

## Disable for Single Commands

```bash
git --no-pager log
git --no-pager diff
git --no-pager branch
```

## Global Configuration

```bash
# Disable all paging
git config --global core.pager ''

# Disable for specific commands
git config --global pager.branch false
git config --global pager.diff false
git config --global pager.log false

# Auto-disable for short output only
git config --global core.pagerFilter false
```

## Environment Variable

```bash
# Temporary disable for terminal session
export GIT_PAGER=''
```

To revert any config changes:
```bash
git config --global --unset core.pager
git config --global --unset pager.{command}
```