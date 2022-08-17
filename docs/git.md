# Git


Remove untracked files:

```shell
$ git clean -f
```

A single command to change the author for the last N commits:

    git rebase -i HEAD~N -x "git commit --amend --author 'Author Name <author.name@mail.example>' --no-edit"

Mess! "fatal: No url found for submodule path 'example/dir' in .gitmodules"

    git rm --cached example/dir -f

## git ignore

Personal:
```
.git/info/exclude
```

Global:
```bash
$ touch ~/.gitignore
$ git config --global core.excludesFile ~/.gitignore
```

## shallow clone

Less files and no .git dir:

    git clone --depth=1 git://someserver/somerepo dirformynewrepo
    rm -rf !$/.git

## submodules

Git clone with submodules:

    git clone --recurse-submodules https://github.com/chaconinc/MainProject

Did you forget to cline with submodules?

    git submodule init
    git submodule update

Update submodules in repo:

    git submodule update --remote --merge

## git filter-repo

`git filter-repo` ([github][1]) is a versatile tool for rewriting history. It is now recommended by the git project instead of `git filter-branch`.

git-filter-repo is a single-file python script, which was done to make installation for basic use on many systems trivial: just place the script into your $PATH.

Installation is as easy as:

    $ PACKAGE_TOOL install git-filter-repo

[1]: https://github.com/newren/git-filter-repo

### Remove large file

**[100 times faster than git filter-branch and simpler (stackoverflow.com)](https://stackoverflow.com/a/61602985/660017)**

> Warning: Do this on a copy of your repository. Many actions of filter-repo cannot be undone. filter-repo will change the commit hashes of all modified commits (of course) and all their descendants down to the last commits!

First you can run:

    git filter-repo --analyze

This helps you to determine what to do next.

You can delete your DVD-rip file everywhere:

    git filter-repo --invert-paths --path-match DVD-rip


## Branches

### Rename default branch

I don't want to have to remember what the default branch is named.

    git branch -m main master
    git push -u origin master

- [stackoverflow](https://stackoverflow.com/a/69344918/660017)

## Organising your clones

Not sure whether I want to include org in clone path like this this guy does:

> This is how I organize my source code.
>
> ```txt
> -- source
> |   |-- dotfiles
> |   |-- hyperclient
> |   |   |-- codegram
> |   |   `-- dblock
> |   `-- grape
> |       |-- grape
> |       |   |-- ruby-grape
> |       |   `-- dblock
> |       `-- grape-swagger
> |           |-- ruby-grape
> |           `-- dblock
> ```
>
> [A Directory Structure for OSS and Work Github Clones](https://code.dblock.org/2016/03/25/a-directory-structure-for-oss-and-work-github-clones.html)
