# Install pyenv

To install pyenv on Fedora 40, you'll need to follow these steps:

1. Install the required dependencies:

```bash
sudo dnf install -y make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel
```

2. Clone the pyenv repository:

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

3. Add pyenv to your PATH and initialize it. Add these lines to your ~/.bashrc or ~/.zshrc file:

```bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

4. Reload your shell configuration:

```bash
source ~/.bashrc
```

5. Verify the installation:

```bash
pyenv --version
```

This should output the version of pyenv you've installed.

Now you can use pyenv to install and manage different Python versions. For example, to install Python 3.9.5:

```bash
pyenv install 3.9.5
```

And to set it as your global Python version:

```bash
pyenv global 3.9.5
```

Would you like me to explain any part of this process in more detail?