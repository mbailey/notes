# azure cli

- [Azure Command-Line Interface (CLI) documentation (learn.microsoft.com)](https://learn.microsoft.com/en-us/cli/azure/)
- [azure cli linux](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=dnf)
- [Tips for using the Azure CLI successfully](https://learn.microsoft.com/en-us/cli/azure/use-cli-effectively?tabs=bash%2Cbash2)
- [Learn to use Bash with the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/azure-cli-learn-bash)


subscriptions=all

--all

## Useful commands

BROWSER=firefox az login # can omit $BROWSER

```shell
function locations(){
  az account list-locations --query [].[displayName] --output tsv
}
```

## Example commands

```shell
az account list
az account set --subscription 'my-subscription-name'
```



## `--output`

Allowed values: json, jsonc, yaml, yamlc, table, tsv, none.

Change the global default format to one of your personal preference by using [az config](https://learn.microsoft.com/en-us/cli/azure/config) such as `az config set core.output=table`

## `--query`

Supports [JMESPath](https://jmespath.org/)! This was created for AWSCLI. :-)
 
## Query with graph api

```shell
az rest --method get --url "https://graph.microsoft.com/v1.0/auditLogs/signIns?&\$filter=contains(userPrincipalName,'mike')&\$top=10" 
```

## TSV

Using `--output tsv`

```shell
az rest --method get \
  --url "https://graph.microsoft.com/v1.0/auditLogs/signIns?&\$filter=contains(userPrincipalName,'luke')&\$top=10" \
  --query 'value[].[userPrincipalName,userDisplayName,ipAddress,conditionalAccessStatus,location.city,status.errorCode]' \
  --output tsv
```

Compared to JQ

```shell
az rest --method get \
  --url "https://graph.microsoft.com/v1.0/auditLogs/signIns?&\$filter=contains(userPrincipalName,'luke')&\$top=10" | 
jq -r '.value[] | [.userPrincipalName,.userDisplayName,.ipAddress,.conditionalAccessStatus,.location.city,.status.errorCode] |
  @tsv'
```

## Linux CLI config

`$HOME/.azure/`

## Install (fedora-36)

```shell
dnf install azure-cli
```

## Disable telemetry

```shell
az configure -d collect_telemetry=false
```

## Login

This will open web browser:

```shell
BROWSER=firefox az login # can omit $BROWSER
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
