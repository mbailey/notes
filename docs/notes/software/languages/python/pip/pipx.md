# Using `pipx` to Install and Run CLI Tools

[pipx (pipx.pypa.io)](https://pipx.pypa.io/stable/)

By ChatGPT *2024-12-11 12:40:14 +11:00 Wed*

**What is `pipx`?**  

`pipx` lets you install and run Python-based command-line applications in
isolated virtual environments. It protects your global Python environment from
dependency conflicts and provides a consistent way to run these tools anywhere
in your directory tree.

**Key Benefits:**  

- **Isolated environments:** Each CLI tool gets its own virtual environment.  
- **Global commands:** Tools are made globally accessible (added to your `PATH`) so you can run them from anywhere.  
- **No conflicts:** Dependencies don’t clash with your main Python environment or other tools.

## Installation

**Recommended Methods:**  

- **macOS:**  

  ```shell
  brew install pipx
  pipx ensurepath
  ```
  
- **Linux (e.g. Fedora):**  

  ```shell
  sudo dnf install pipx
  pipx ensurepath
  ```
  
- **Other Linux Distros (via pip):**  

  ```shell
  python3 -m pip install --user pipx
  python3 -m pipx ensurepath
  ```
  
- **Windows (via pip):**  

  ```shell
  py -m pip install --user pipx
  pipx ensurepath
  ```
  
If `ensurepath` shows a warning about directories not on your `PATH`, open a new terminal or `source` your shell’s config file. For more installation methods and distributions, see the official [pipx documentation](https://pipx.pypa.io/stable/installation/).

**What does `ensurepath` do?**  
`pipx ensurepath` checks if the directory where `pipx` installs apps (usually `~/.local/bin` on Linux/macOS) is on your `PATH`. If not, it updates your shell initialization files (like `~/.bashrc`, `~/.zshrc`) so that installed tools are accessible by simply typing their names. This doesn’t usually reorder your `PATH`; it just ensures `pipx`’s bin directory is included. Your existing Python tools and `pyenv`-managed versions still take precedence.

## Using `pipx`

**Installing a CLI Tool (e.g. `aider-chat`):**  

```shell
pipx install aider-chat
```

After this, you can run `aider-chat` from any directory.

**Run Commands Temporarily:**  

```shell
pipx run some-tool
```

This downloads, installs, and runs the tool in an ephemeral environment that’s removed afterwards.

**Upgrading or Removing Tools:**  

```shell
pipx upgrade aider-chat
pipx uninstall aider-chat
```

## How `pipx` Chooses Python

By default, `pipx` uses the Python interpreter it was installed with (e.g. the `python3` used in `python3 -m pip install --user pipx`). If you use `pyenv` or other environment managers, `pipx` typically respects your current `PATH` settings. To override this, set `PIPX_DEFAULT_PYTHON` or use the `--python` flag:

```shell
pipx install aider-chat --python python3.10
```

## Interaction with `pyenv` and Other Tools

`pipx` creates separate virtual environments for each installed tool, so it’s largely unaffected by `pyenv` or other environment managers. Changing your Python version with `pyenv` won’t break existing `pipx`-installed tools since they have their own environments. If you want `pipx` to use a specific Python version managed by `pyenv`, just ensure that version is active before running `pipx install`, or specify `--python`.

## Potential Issues or Conflicts

- **PATH issues:** If tools aren’t found, ensure `~/.local/bin` (or the directory indicated by `ensurepath`) is on your `PATH`. Restart your shell if needed.
- **Global vs. local environments:** `pipx` is not meant to manage libraries—only CLI tools. Continue using `venv` or other methods for project-specific dependencies.
- **Versioning and dependency conflicts:** `pipx` isolates each tool, so conflicts are rare. If a tool is incompatible with your system’s Python or dependencies, it won’t affect others.

---

**In summary, `pipx` provides a clean, safe way to install and run Python-based CLI tools.** This ensures that when you install something like `aider-chat`, you’ll have a stable, globally accessible command without cluttering or conflicting with your main Python environment.

