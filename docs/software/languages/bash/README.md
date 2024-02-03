# bash

Strictly speaking, this is not all `bash`. It's command line unix.

Find directory holding script:

    SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

Confirmation request:

    local regex_yes="^[Yy]$"
    read -p "Are you sure you want to continue? " -n 1 -r
    echo
    if [[ $REPLY =~ $regex_yes ]]

Remove last 4 chars from var:

    ${v::-4}


Remove broken symlinks:

    find . -xtype l | xargs --no-run-if-empty unlink

## Command shortcuts

| shortcut | action | 
| -------- | ------ |
| ++ctrl+k++ | delete to end of line
| ++ctrl+u++ | delete to start of line


- Mapfile: Read lines from the standard input into an indexed array variable.


