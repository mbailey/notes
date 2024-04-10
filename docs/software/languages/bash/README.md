# bash

Strictly speaking, this is not all `bash`. It's command line unix.

- [Bash string manipulation using parameter expansion](bash-string-manipulation-using-parameter-expansion.md)

## Keyboard shortcuts

| shortcut | action                  |     |
| -------- | ----------------------- | --- |
| Ctrl+k   | delete to end of line   |     |
| Ctrl+u   | delete to start of line |     |

## General

**Remove broken symlinks:**

    find . -xtype l | xargs --no-run-if-empty unlink


## Scripting

**Mapfile:** Read lines from the standard input into an indexed array variable.  

### Set SCRIPT_DIR to directory holding script

There are many answers out there:

### 1

```shell
SCRIPT_DIR=="$(dirname -- "${BASH_SOURCE[0]:-${0}}")"
```
### 2 Mixed claims about whether macOS comes with realpath

```shell
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE:-"${0}"}")")"
```
### 3

```shell
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
```





**Request user confirmation:**
```shell
local regex_yes="^[Yy]$"
read -p "Are you sure you want to continue? " -n 1 -r
echo
if [[ $REPLY =~ $regex_yes ]]
```






