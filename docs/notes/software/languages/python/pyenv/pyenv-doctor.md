# pyenv doctor

This command will check your `pyenv` installation for common issues and provide feedback on how to resolve them. It does not typically take options like `-c`. If `-c` is intended to be a reference to CPython (the standard implementation of Python), it's worth noting that `pyenv doctor` checks the pyenv environment as a whole and isn't typically used to check specific Python implementations.

## Install

Fedora:

```
git clone https://github.com/pyenv/pyenv-doctor.git $(pyenv root)/plugins/pyenv-doctor
```

## Usage

These commands check your pyenv.

```
pyenv doctor # check pyenv
pyenv doctor -c # check 
```

