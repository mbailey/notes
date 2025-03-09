---
alias: Disable Sleep
---
# Disable Sleep

To disable suspend (sleep mode) on macOS, you can use the following Terminal command:

```
sudo pmset -a disablesleep 1
```

This command uses the `pmset` utility to modify power management settings. Here's a breakdown:

- `sudo`: Run the command with administrator privileges
- `pmset`: The power management settings utility
- `-a`: Apply the setting to all power sources (battery and AC)
- `disablesleep 1`: Enable the "disable sleep" setting (1 means enable, 0 means disable)

To re-enable sleep mode later, you can use:

```
sudo pmset -a disablesleep 0
```

Would you like me to explain more about this command or provide any additional information about power management on macOS?