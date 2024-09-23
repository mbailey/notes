---
alias: macOS Launch Daemons
---
# macOS Launch Daemons

## Commands

### Find an agent

```shell
sudo find /Library/LaunchAgents /Library/LaunchDaemons /System/Library/LaunchAgents /System/Library/LaunchDaemons -name "*whisperserver*"
```


## Stop

```shell
sudo launchctl stop com.system.whisperserver
```

### Start

```shell
sudo launchctl stop com.system.whisperserver
```

### Status

```shell
sudo launchctl print system/com.system.whisperserver
```
