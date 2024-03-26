# ykman - yubikey manager

## Install

### macOS

1. Download and install the official package from Yubico
2. Add to your path

    ```shell
    export PATH="$PATH:/Applications/YubiKey Manager.app/Contents/MacOS"
    ```

### bash completion

Run this to setup bash completion

```
source <(_YKMAN_COMPLETE=bash_source ykman | sudo tee /etc/bash_completion.d/ykman)
```
