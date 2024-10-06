# Powershell

## TAB completion

By default Powershell uses right arrow key for completion but we can make it use TAB.

(Still seems to need -> to accept suggestion)

```powershell
# Install PSReadLine (run as administrator if needed)
Install-Module -Name PSReadLine -Force

# Add this to your PowerShell profile to configure bash-like completion
Set-PSReadLineKeyHandler -Key Tab -Function Complete
```