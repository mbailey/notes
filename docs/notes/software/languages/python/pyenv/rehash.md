# pyenv rehash

By claude-3-5-sonnet 2025-01-08 14:32:54 +11:00 Wed

After uninstalling a package, you might need to rehash pyenv to update the shims. Try this command:

```bash
pyenv rehash
```

This will refresh pyenv's shims, removing references to uninstalled executables. After running this command, you shouldn't see the "No such file or directory" error anymore.

If you're still seeing the error, you might also want to:

1. Clear your shell's command hash table:
```bash
hash -r
```

2. Or try restarting your terminal session.

If the problem persists, you can also check if there are any aliases or references to 'chicken' in your shell configuration files (.bashrc, .zshrc, etc.).
