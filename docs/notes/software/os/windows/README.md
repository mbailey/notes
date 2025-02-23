# Microsoft Windows

The non-unix operating system.


## CLI

Windows offers three CLi alternatives:

- **Command Prompt:** Legacy
- **PowerShell:** 21st Century replacement
- **WSL Linux:** Windows commands and environment can be exposed to linux virtual machines

## Environment Variables

- **%UserProfile%:** `C:\Users\[YourUsername]`
### Print all

**Command Prompt:**

```shell
set
```

**PowerShell**: 

```shell
Get-ChildItem Env:
```
```shell
gci env:
```

## See also:

- [WSL](wsl.md): Windows Subsystem for Linux