## When to use `python3`

It depends largely on your system and how Python is set up:

**On older systems:**

- **`python`** might refer to Python 2.x.
- **`python3`** is explicitly Python 3.x.

**On newer systems (like recent Linux distributions):**

- **`python3`** is the standard command for Python 3.
- **`python`** may be absent, or may point to Python 3, but this can vary by distribution or your local setup.

**Best practice:**

- If you want to ensure you’re running Python 3 (especially when Python 2 might still be present), always use **`python3`**.
- If you know your system’s `python` command is set to Python 3 (for example, through tools like `pyenv` or a recent distro that defaults `python` to Python 3), then using **`python`** alone is fine.

In short, to avoid ambiguity, `python3` is safer for guaranteeing Python 3, while `python` might be Python 2 or Python 3 depending on how your system is configured.