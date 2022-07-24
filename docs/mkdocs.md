# MkDocs

Markdown based static site generator aimed at documentation (including this).

**Refs:**

- [MkDocs](https://www.mkdocs.org/)
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)

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
