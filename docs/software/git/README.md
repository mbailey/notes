---
alias: Git
---
# Git

Source control.

## Conventions

- [Commit](conventions/commit.md)

## Development Workflow

- [development-setup](development-setup.md)

## How to

- [Self Hosting](self-hosting.md)
- [Authentication using Device Flow](./authentication-using-device-flow.md)
- [Clone a fork](clone-a-fork.md)
- [Find deleted files](Find%20deleted%20files.md)

- [debugging git push](debugging%20git%20push.md)
- [Remove large file from git repo with git-filter-repo](remove-large-file.md)

## Core Git

- [[Alias]]
- [Branch](./branches.md)
- [Commit](Commits.md)
- [Config](./config.md)
- [Diff](./diff.md)
- [Submodule](./git-submodules.md)
- [Ignore](./git-ignore.md)
- [pre-commit (pre-commit.com)](https://pre-commit.com/)
- reflog
- [Stash](stash/README.md)
- [Tag](tags.md)

## Extras

- [git-lfs](git-lfs.md)
- GitKraken
- GitLens











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





## See also

- [Git - user-manual](https://git-scm.com/docs/user-manual) (file:///usr/share/doc/./user-manual.html)
- [Git - Community](https://git-scm.com/community)
- `man gittutorial`
- [Tech Talk Linus Torvalds on git - YouTube](https://www.youtube.com/watch?v=4XpnKHJAok8&list=WL&index=2&t=2s)
    - distributed
- https://gregoryszorc.com/blog/2021/05/12/why-you-shouldn%27t-use-git-lfs/
    - performance
- `git stash pop` song by The Ramones [Blitzkrieg Bop (2016 Remaster) - YouTube](https://www.youtube.com/watch?v=skdE0KAFCEA)
- [How to Use Git Shallow Clone to Improve Performance  Perforce (www.perforce.com)](https://www.perforce.com/blog/vcs/git-beyond-basics-using-shallow-clones)
- [[vscode-gitlens-open-on-remote]]