# az cli

- [az reference](https://learn.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest)
- [Azure CLI configuration (learn.microsoft.com)](https://learn.microsoft.com/en-us/cli/azure/azure-cli-configuration)
- [Azure Command-Line Interface (CLI) documentation (learn.microsoft.com)](https://learn.microsoft.com/en-us/cli/azure/)
- [Install azure cli linux](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=dnf)
- [Sign in with Azure CLI](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli)
- [Tips for using the Azure CLI successfully](https://learn.microsoft.com/en-us/cli/azure/use-cli-effectively?tabs=bash%2Cbash2)
- https://learn.microsoft.com/en-us/cli/azure/use-cli-effectively?tabs=bash%2Cbash2
- [Learn to use Bash with the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/azure-cli-learn-bash)
- [Use and manage extensions with the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/azure-cli-extensions-overview)
- [Create an Azure service principal with the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli)
- [What are managed identities for Azure resources?](https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview)
    - [Azure services that can use managed identities to access other services](https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/managed-identities-status)
    - [Experimenting with Azure Arc  Journey Of The Geek (journeyofthegeek.com)](https://journeyofthegeek.com/2021/06/12/experimenting-with-azure-arc/)

[azure-arc-and-managed-identities](azure-arc-and-managed-identities.md)

##  Install (fedora-36)

```shell
dnf install azure-cli
```
## Config

Scripts should define their own path for  `$AZURE_CONFIG_DIR`. (e.g. `~/.azure/scriptname`). Better to append PID?

> The configuration file itself is located at `$AZURE_CONFIG_DIR/config`. The default value of `AZURE_CONFIG_DIR` is `$HOME/.azure` on Linux and macOS, and `%USERPROFILE%\.azure` on Windows.
>
- [CLI configuration file (learn.microsoft.com)](https://learn.microsoft.com/en-us/cli/azure/azure-cli-configuration#cli-configuration-file)


## Create things

```
az group create -l global -n MyResourceGroup
```

## Handy commands

- `version`
- `upgrade`
- `exit`


- Get tenant id: `az account show --query tenantId -o tsv`

## REST API commands (az rest)

If generic update parameters and az resource don't meet your needs, you can use the az rest command to call the REST API. The command automatically authenticates using the logged-in credential and sets header Content-Type: application/json. For more information, see Azure REST API reference.

This example works with the Microsoft Graph API. To update redirect URIs for an Application, call the Update application REST API, as in this code:
Azure CLI

```
# Get the application
az rest --method GET \
    --uri 'https://graph.microsoft.com/v1.0/applications/b4e4d2ab-e2cb-45d5-a31a-98eb3f364001'

# Update `redirectUris` for `web` property
az rest --method PATCH \
    --uri 'https://graph.microsoft.com/v1.0/applications/b4e4d2ab-e2cb-45d5-a31a-98eb3f364001' \
    --body '{"web":{"redirectUris":["https://myapp.com"]}}'

When using --uri-parameters for requests in the form of OData, please make sure to escape $ in different environments: in Bash, escape $ as \$ and in PowerShell, escape $ as `$

```

## Sign in with Azure CLI

- [Sign in with Azure CLI](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli)

-  Sign in interactively
-  Sign in with credentials on the command line
-  Sign in with a service principal
-  Sign in with a different tenant
-  Sign in with a managed identity

## Useful commands

BROWSER=firefox az login # can omit $BROWSER

```shell
function locations(){
  az account list-locations --query [].[displayName] --output tsv
}
```


Show login details: 

```console
$ az ad signed-in-user show
{
  "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#users/$entity",
  "businessPhones": [],
  "displayName": "Example user",
  "givenName": "Example",
  "id": "12345678-1234-1234-1234-123456789012",
  "jobTitle": null,
  "mail": null,
  "mobilePhone": null,
  "officeLocation": null,
  "preferredLanguage": null,
  "surname": "User",
  "userPrincipalName": "example.user@example.net"
}
```


## Example commands

```shell
az account list
az account set --subscription 'my-subscription-name'
```

Azure maximum request size is 100MB

```console
$ getconf ARG_MAX
2097152 # Get argument limit in bytes on POSIX systems
```

## `--query`

Supports [JMESPath](https://jmespath.org/)! This was created for AWSCLI. :-)

## `--output`

Allowed values: json, jsonc, yaml, yamlc, table, tsv, none.

Change the global default format to one of your personal preference by using [az config](https://learn.microsoft.com/en-us/cli/azure/config) such as `az config set core.output=table`

## Using az cache (--defer )

AZ offers a local cache for you to use when creating resource that requires a dependant resource to exist. You pass the `--defer` argument on the first call. You *may* pass `--defer` argument when adding dependant resources, as long as the last one does not have `--defer` as that triggers the creation all of them.

bash-my-aws offers these commands:

Author: Mike Bailey <mike@bailey.net.au>
Date:   Sun Dec 11 21:30:20 2022 +1100

    Add az cache functions
    
    az-cache-items(): list them
    az-cache-item(): show one (json)
    az-cache-item-delete(): delete one
    
    Example Usage:
    
    # show contents of all items in cache
    az-cache-items | az-cache-item
    
    # delete all cache items with foo in them
    az-cache-items | grep foo | az-cache-item-delete
    
    # Part of BMA's unofficial, unprofessional "Azvent of Code"
    # Use at own risk!


## Accept args from STDIN

Azure CLI has built-in support to process commands with multiple `--ids` in parallel to achieve the same effect of xargs. Note that `@-` is used to get values from the pipe:
```bash
az vm list --resource-group MyResourceGroup --show-details \
  --query "[?powerState=='VM stopped'].id" \
  --output tsv | az vm start --ids @-
```

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


## Disable telemetry

```
export AZURE_CORE_COLLECT_TELEMETRY=0
```

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


Save this to "${HOME}/.az-completion":

```bash
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

Source it from your bashrc:

```
export BASH_COMPLETION_USER_DIR="${HOME}/.local/share/bash-completion"
# mkdir -p "$BASH_COMPLETION_USER_DIR="
source "${BASH_COMPLETION_USER_DIR}/completions/az-completions"
```
