# MkDocs

Markdown based static site generator aimed at documentation (including this).

**Refs:**

- [MkDocs](https://www.mkdocs.org/)
- [Getting Started with MkDocs](https://www.mkdocs.org/getting-started/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
    - [Sponsor squidfunk](https://github.com/sponsors/squidfunk)

It's very simple:

```bash
$ mkdocs -h
Usage: mkdocs [OPTIONS] COMMAND [ARGS]...

  MkDocs - Project documentation with Markdown.

Options:
  -V, --version  Show the version and exit.
  -q, --quiet    Silence warnings
  -v, --verbose  Enable verbose output
  -h, --help     Show this message and exit.

Commands:
  build      Build the MkDocs documentation
  gh-deploy  Deploy your documentation to GitHub Pages
  new        Create a new MkDocs project
  serve      Run the builtin development server
```

Install

    pip install mkdocs

Creating a new project

    mkdocs new my-project
    cd my-project

Run

    mkdocs serve


Add `mkdocs-material` as a submodule:

    git submodule add https://github.com/squidfunk/mkdocs-material.git
    echo "site/" >> .gitignore

Commit:

    git add .gitmodules .gitignore mkdocs-material
    git commit -m 'Add mkdocs-material submodule'

If cloning the repo for the first time:

    git clone --recursive https://github.com/<repo-owner>/<repo-name>.git

If you already have the repo, and need to pull in the submodule:

    git submodule update --init  
