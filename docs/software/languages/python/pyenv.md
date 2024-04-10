# python pyenv

1. **Install pyenv**: Run `brew install pyenv`

2. **Add pyenv init to your bashrc**:

    ```shell
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
```

3. **Source bashrc**: Run `source ~/.bashrc`

4. **Install some python**:

    ```shell
    pyenv install 3
    # pyenv set local 3
    # pyenv set global 3
    ```


## pyenv doctor

This command will check your `pyenv` installation for common issues and provide feedback on how to resolve them. It does not typically take options like `-c`. If `-c` is intended to be a reference to CPython (the standard implementation of Python), it's worth noting that `pyenv doctor` checks the pyenv environment as a whole and isn't typically used to check specific Python implementations.

## Install

```
git clone https://github.com/pyenv/pyenv-doctor.git $(pyenv root)/plugins/pyenv-doctor
```

## Use

These commands check your pyenv.

```
pyenv doctor # check pyenv
pyenv doctor -c # check 
```

