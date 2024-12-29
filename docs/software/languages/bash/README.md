---
alias: bash
---
# bash

Strictly speaking, this is not all `bash`. It's command line unix.

- [Bash string manipulation using parameter expansion](bash-string-manipulation-using-parameter-expansion.md)

## Cool tricks

- [variable+x](variable+x.md)

## Commands


## `bash --norc`

Starts Bash shell without reading startup files (~/.bashrc, ~/.profile), providing a clean environment.

## Keyboard shortcuts

| shortcut | action                  |     |
| -------- | ----------------------- | --- |
| Ctrl+k   | delete to end of line   |     |
| Ctrl+u   | delete to start of line |     |

## General

**Remove broken symlinks:**

    find . -xtype l | xargs --no-run-if-empty unlink


## Scripting

- **Mapfile:** Read lines from the standard input into an indexed array variable.  


### "Busybox" style function execution via "symlinked binaries"

Make certain functions from a file executable:

```shell
bin/git-artifact-repo-update -> ../lib/functions
```



- https://en.wikipedia.org/wiki/BusyBox

```shell
# Execute function with same name as file called unless sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  "$(basename "$0")" "$@"
fi
```

### Set SCRIPT_DIR to directory holding script

There are a lot of different methods out there. Cross platform solution needs further review.

1. **Basic:**

```shell
SCRIPT_DIR=="$(dirname -- "${BASH_SOURCE[0]:-${0}}")"
```

2. **Mixed claims about whether macOS comes with realpath:**

```shell
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE:-"${0}"}")")"
```

3. **Another one:**

```shell
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
```


### Request user confirmation


```shell
local regex_yes="^[Yy]$"
read -p "Are you sure you want to continue? " -n 1 -r
echo
if [[ $REPLY =~ $regex_yes ]]
```


**Default to Yes**:

```shell
local regex_yes="^[Yy]?$"  # The '?' after [Yy] allows for an empty response to be treated as 'Yes'
read -p "Are you sure you want to continue? (Y/n) " -n 1 -r
echo  # Move to a new line
if [[ ! $REPLY =~ $regex_yes ]]; then
    echo "Update cancelled."
    return 1  # Exit the function with a non-zero exit status to indicate failure
else
    echo "Proceeding with update."
fi
```