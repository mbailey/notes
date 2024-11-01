---
alias: Git
---
# Git

## Tools

- GitKraken
- GitLens

## Conventions

- [commit](conventions/commit.md)

## Commands

- [remove git-lfs](remove%20git-lfs.md)

- [Authentication using Device Flow](./authentication-using-device-flow.md)
- [[alias]]
- [branches](./branches.md)
- [config](./config.md)
- [diff](./diff.md)
- [git submodules](./git-submodules.md)
- [ignore](./git-ignore.md)
- [pre-commit (pre-commit.com)](https://pre-commit.com/)
- [self-hosted](self-hosted.md)
- [stash](stash/README.md)
- [tags](tags.md)
- [Find deleted files](Find%20deleted%20files.md)

- [debugging git push](debugging%20git%20push.md)

- [Git - user-manual](https://git-scm.com/docs/user-manual) (file:///usr/share/doc/./user-manual.html)
- [Git - Community](https://git-scm.com/community)
- `man gittutorial`
- [Tech Talk Linus Torvalds on git - YouTube](https://www.youtube.com/watch?v=4XpnKHJAok8&list=WL&index=2&t=2s)
    - distributed
- https://gregoryszorc.com/blog/2021/05/12/why-you-shouldn%27t-use-git-lfs/
    - performance
- `git stash pop` song by The Ramones [Blitzkrieg Bop (2016 Remaster) - YouTube](https://www.youtube.com/watch?v=skdE0KAFCEA)
- [How to Use Git Shallow Clone to Improve Performance  Perforce (www.perforce.com)](https://www.perforce.com/blog/vcs/git-beyond-basics-using-shallow-clones)


Show commit summary:

```shell
git show --stat
```

Stage non-whitespace changes ([ref](https://stackoverflow.com/a/45486981)):

```shell
git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -
```

[config](./config.md)





**List files in change**: git show --name-only --pretty=format:




## Untracked files

List untracked files and dirs:

```shell
git clean -fdn
```

**List modification times**:

```shell
git clean -n | awk '{print $3}' | xargs -I {} stat -c '%y %n' {} | sort -n
```

**Remove untracked files and dirs:**

```shell
git clean -fd
```


Stash untracked files

```shell
git stash --include-untracked # short arg is -u
```



## Deal with Obsidian sync pulling changes (when you didn't make local changes)

```shell
git fetch --all
git reset --hard origin/master
```

## Global Ignore Rules

```
git config --global core.excludesfile ~/.gitignore_global
echo '*sync-conflict*' >> ~/.gitignore_global
```

## Ignore some files locally

- [How do I configure git to ignore some files locally - Stack Overflow (stackoverflow.com)](https://stackoverflow.com/questions/1753070/how-do-i-configure-git-to-ignore-some-files-locally/1753078#1753078)

> Patterns which are specific to a particular repository but which do not need to be shared with other related repositories (e.g., auxiliary files that live inside the repository but are specific to one user's workflow) should go into the `$GIT_DIR/info/exclude` file.

Note, if you already have unstaged changes you must run the following after editing your ignore-patterns:
```
git update-index --assume-unchanged <file-list>
```

[config](./config.md)


## Share via sneakernet

    wget https://github.com/mbailey.gpg
    gpg --import ./mbailey.gpg
    # cd cloned git repo
    git bundle create mbailey.bundle --all
    gpg --recipient mike@example.com  -e  mbailey.bundle
    # Send me mbailey.bundle.gpg

## Check out file from specific commit

    git checkout c5f567 -- file1/to/restore file2/to/restore

## Checkout Remote Branch

    git fetch --all
    git switch origin/gh-pages # creates branch if missing and sets up tracking for git pull/push

## Diff two arbitrary files using git diff (e.g. for gpg files)

  git diff --no-index file1 file2

## Change commit author 

```shell
git commit --amend --author="Alex Doe <alex@work.com>" --no-edit
```

For the last N commits:

    git rebase -i HEAD~N -x "git commit --amend --author 'Author Name <author.name@mail.example>' --no-edit"

## Update forked github repo

```shell
git remote add upstream git@github.com:original-repo/goes-here.git
git fetch upstream
git checkout master
git rebase upstream/master
git push origin master --force-with-lease
```

## gpg diff

    https://gist.github.com/marceloalmeida/e6593b93b388cdf1dbc282dffd424d1b#file-readme-md

    git config --global diff.gpg.textconv "gpg --no-tty --decrypt"

    echo "*.gpg filter=gpg diff=gpg" >> .gitattributes
    echo "*.asc filter=gpg diff=gpg" >> .gitattributes

## Delete dangling commits

- [Listing and deleting Git commits that are under no branch (dangling) - Stack Overflow](https://stackoverflow.com/questions/3765234/listing-and-deleting-git-commits-that-are-under-no-branch-dangling)

## shallow clone

Less files and no .git dir:

    git clone --depth=1 git://someserver/somerepo dirformynewrepo
    rm -rf !$/.git

## git filter-repo

`git filter-repo` ([github][1]) is a versatile tool for rewriting history. It is now recommended by the git project instead of `git filter-branch`.

git-filter-repo is a single-file python script, which was done to make installation for basic use on many systems trivial: just place the script into your $PATH.

Installation is as easy as:

    $ PACKAGE_TOOL install git-filter-repo

[1]: https://github.com/newren/git-filter-repo

## Remove file:

  # git recommends using [git-filter-repo](https://github.com/newren/git-filter-repo/#simple-example-with-comparisons)

    git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD


# [Remove large file from git repo](remove-large-file.md)


## Maintain standard initial branch

    git config --global init.defaultBranch master

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


## lfs

    git lfs ls-files --all

Remove from lfs

    git lfs untrack '<file-type>'
    git rm --cached '<file-type>'
    git add '<file-type>'
    git commit -m "restore '<file-type>' to git from lfs"



## See also

- [[vscode-gitlens-open-on-remote]]
- 
