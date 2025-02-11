---
alias: 'SCRIPT_DIR: directory containing current script'
---
# SCRIPT_DIR:  directory containing current script

- **Follow symlinks:** Ensures scripts symlinked into `~/.local/bin` can find `../lib`:

```shell
command -v realpath &> /dev/null || {
  echo "Error: 'realpath' is required but not found. Please install 'coreutils' (e.g. 'brew install coreutils' on macOS)." >&2
  exit 1
}
SCRIPT_DIR="$(dirname -- "$(realpath "${BASH_SOURCE[0]}")")"
```