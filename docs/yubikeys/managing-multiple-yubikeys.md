# Managing Multiple Yubikeys

Recommended patterns for managing Yubikeys.

## Principles

- **Efficiency**: A permanent key in every machine
- **Redundancy**: Anything important should be on more than one yubikey
- **Security**: Don't expose secrets on untrusted devices

## Recommendations

1.  **Masterkey you keep with you**
    - Yubikey on your keyring
    - Add it to everything you need access to
    - You can use this to "bless" other yubikeys where required

2. **USB-A nano in each laptop**
    - USB-C ports are valuable (unless it's all you have - Mac)
    - Setup for each thing you need (with the help of your masterkey)