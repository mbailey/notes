# WSL - Windows Subsystem for Linux

Built in tool that enables running Linux OS under Windows.
## Configuration

- [Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config)
- **[%UserProfile%\\.wslconfig](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig)** to configure **global settings** across all installed distributions running on WSL 2.
- **[/etc/wsl.conf](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconf)** to configure **local settings** per-distribution for each Linux distribution running on WSL 1 or WSL 2.
- **8 second rule**: You must wait until the subsystem running your Linux distribution completely stops running and restarts for configuration setting updates to appear. This typically takes about 8 seconds after closing ALL instances of the distribution shell.

## Commands

**Shutdown**: `wsl --shutdown`
**Terminate:** `wsl --terminate <distro_name>`
**List:** `wsl --list --running`

## Running Windows Commands from WSL Terminal

You can run windows Command Prompt and PowerShell commands from WSL Linux.

**Command Prompt:** `cmd.exe /C set`

**PowerShell:** `powershell.exe Get-ChildItem Env:`

#### Note:

- **Running Windows executables from WSL:** When you run Windows executables from WSL, the path to the executable is typically required unless it's in the Windows system PATH. For system utilities like `cmd.exe` and `powershell.exe`, no additional path specification is needed because they reside in a directory that's included in the system PATH.
- **File System Integration:** WSL integrates with the Windows file system, allowing you to execute Windows binaries directly. However, keep in mind that while you can access Windows files from within WSL, the reverse (accessing WSL's Linux files from Windows) should be done cautiously to avoid data corruption.
- **Performance Note:** Running Windows applications from WSL incurs a slight performance penalty compared to running them directly in their native environment due to the cross-environment call.

