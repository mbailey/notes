---
alias: 'SCRIPT_DIR: directory containing current script'
---
# SCRIPT_DIR: directory containing current script

This functionality is provided by the shared `get_script_dir()` function.

## Usage

Source the shared function and use it to set SCRIPT_DIR:

```shell
source "$(dirname -- "$(realpath "${BASH_SOURCE[0]}")")/../lib/bash-functions/get-script-dir.sh"
SCRIPT_DIR="$(get_script_dir)"
```

The function:
- Follows symlinks correctly
- Falls back to alternatives if realpath is not available
- Works when scripts are symlinked into `~/.local/bin`
- Handles relative symlinks properly

## Implementation

The implementation is in `lib/bash-functions/get-script-dir.sh`. It provides:

- Primary implementation using `realpath` when available
- Fallback using `readlink` for symlink resolution
- Final fallback using `pwd` for basic path resolution

See the source file for the complete implementation.
