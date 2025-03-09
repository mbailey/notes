# fd

[A simple, fast and user-friendly alternative to 'find' (github.com/sharkdp/fd)](https://github.com/sharkdp/fd)

- Intuitive syntax: fd PATTERN instead of find -iname '*PATTERN*'.
- Regular expression (default) and glob-based patterns.
- Very fast due to parallelized directory traversal.
- Uses colors to highlight different file types (same as ls).
- Supports parallel command execution
- Smart case: the search is case-insensitive by default. It switches to case-sensitive if the pattern contains an uppercase character*.
- Ignores hidden directories and files, by default.
- Ignores patterns from your .gitignore, by default.
- The command name is 50% shorter* than find :-).

## Install

```shell
dnf install fd-find
```


## Usage

Search by extension:

```shell
> fd -e md
CONTRIBUTING.md
README.md
```

Include hidden files:

```shell
fd -H pre-commit
.git/hooks/pre-commit.sample
```

Command execution:

```shell
fd -e zip -x unzip # run command with each item
fd -g 'test_*.py' -X vim # run single comand with all items
```

Filter by type:

 `-t, --type <filetype>`
 
- file (f)
- directory (d)
- symlink (l)
- executable (x)
- empty (e)o
- socket (s)
- pipe (p)

### Using `fd` with `fzf`

- [doc](https://github.com/sharkdp/fd#using-fd-with-fzf)

Type `vim <Ctrl-T>` on your terminal to open fzf and search through the fd-results

```
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
```

fzf keybindings:

```shell
if [[ -f /usr/share/fzf/shell/key-bindings.bash ]]; then
  source /usr/share/fzf/shell/key-bindings.bash
fi
```