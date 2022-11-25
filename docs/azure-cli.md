# azure cli

- [azure cli linux](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=dnf)

## Install (fedora-36)

```shell
dnf install azure-cli
```

## Login

This will open web browser:

```shell
az login
```

Select Account to use:

```shell
az account 
```

## Query with JMESPath

<https://learn.microsoft.com/en-us/cli/azure/query-azure-cli?tabs=concepts%2Cbash>

## AZ CLI Autocomplete

Load bash completion:

`source "${HOME}/az.completion"` # add to ~/.bashrc

Save this to "${HOME}/az.completion":

```python
_python_argcomplete() {
    local IFS=$'\013'
    local SUPPRESS_SPACE=0
    if compopt +o nospace 2> /dev/null; then
        SUPPRESS_SPACE=1
    fi
    COMPREPLY=( $(IFS="$IFS" \
                  COMP_LINE="$COMP_LINE" \
                  COMP_POINT="$COMP_POINT" \
                  COMP_TYPE="$COMP_TYPE" \
                  _ARGCOMPLETE_COMP_WORDBREAKS="$COMP_WORDBREAKS" \
                  _ARGCOMPLETE=1 \
                  _ARGCOMPLETE_SUPPRESS_SPACE=$SUPPRESS_SPACE \
                  "$1" 8>&1 9>&2 1>/dev/null 2>/dev/null) )
    if [[ $? != 0 ]]; then
        unset COMPREPLY
    elif [[ $SUPPRESS_SPACE == 1 ]] && [[ "$COMPREPLY" =~ [=/:]$ ]]; then
        compopt -o nospace
    fi
}
complete -o nospace -o default -o bashdefault -F _python_argcomplete "az"
```
