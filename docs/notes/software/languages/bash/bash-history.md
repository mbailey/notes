# bash-history

I want to immediately append bash history to disk.

- [Better Bash history  Arabesque (blog.sanctum.geek.nz)](https://blog.sanctum.geek.nz/better-bash-history/)

```shell
shopt -s cmdhist            # One line per command
shopt -s histappend         # Append instead of replace file

HISTCONTROL=ignoreboth # repeated commands and those starting with space
HISTFILESIZE=1000000 # lines to store to disk
HISTIGNORE='ls:bg:fg:history'
HISTSIZE=1000000 # lines to keep in memory
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a' # Store history immediately
```

## Disable

- `unset HISTFILE`
- `set +o`