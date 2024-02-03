# Git submodules

- [Git - Submodules (git-scm.com)](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

Submodules allow you to keep a Git repository as a subdirectory of another Git
repository. This lets you clone another repository into your project and keep
your commits separate.

The git submodule command is available since Git 1.5.3 (2007).

Git Submodules get a bad rap. They were the "new shiny thing" introduced in
2007 and fulfilled a perceived need. Many of us used them, got confused, and
swore "never again". Revisting them in 2022, it seems a bit of work has been
done to make using them easier.

## List submodules

```shell
git submodule status
```

## Git clone with submodules

Still not super clear on this...

Make sure the parent repo knows that its submodule now tracks a branch:

```shell
cd /path/to/your/parent/repo
git config -f .gitmodules submodule.<path>.branch <branch>
```

Make sure your submodule is actually at the latest of that branch:

```shell
cd path/to/your/submodule
git checkout -b branch --track origin/branch
  # if the master branch already exist:
  git branch -u origin/master master
```

- [How can I specify a branchtag when adding a Git submodule - Stack Overflow (stackoverflow.com)](https://stackoverflow.com/questions/1777854/how-can-i-specify-a-branch-tag-when-adding-a-git-submodule/18799234#18799234)



```shell
git clone --recurse-submodules https://github.com/chaconinc/MainProject
git submodule update --init --recursive
```
- [Set branch for all Git Submodules - Stack Overflow (stackoverflow.com)](https://stackoverflow.com/questions/27927023/set-branch-for-all-git-submodules/55885186#55885186)

## Update submodules in repo:

    git submodule update --remote --recursive --rebase # [--merge]

## Config

    $ cat .gitmodules
    [submodule "public"]
        path = public
        url = git@github-mbailey:mbailey/notes
        branch = master
    [submodule "work/work-notes"]
        path = work/work-notes
        url = git@github-work/Work/work-notes.git
        branch = main

Include submodule status in `git diff` output (vs. `git diff --submodule`):

    git config --global diff.submodule log

Show short summary of changes to your submodules:

    git config --global status.submodulesummary 1

Check submodules have been pushed before pushing changes:

    git config --global push.recurseSubmodules check # on-demand


## Add submodule to repository

- [Using submodules in Git - (vogella.com)](https://www.vogella.com/tutorials/GitSubmodules/article.html#submodules_trackbranch)

```shell
git submodule add -b master git@github-mbailey:mbailey/notes.git public

# Alternatively, don't track head of master branch
# git submodule add git@github-mbailey:mbailey/notes.git public

git submodule init
```

## Remove submodule from repository

```
git rm <path-to-submodule> # and commit
```

This removes the filetree at <path-to-submodule>, and the submodule's entry
in the .gitmodules file. I.e. all traces of the submodule in your repository
proper are removed.

As the docs note however, the .git dir of the submodule is kept around (in
the modules/ directory of the main project's .git dir), "to make it possible
to checkout past commits without requiring fetching from another repository".
If you nonetheless want to remove this info, manually delete the submodule's
directory in .git/modules/, and remove the submodule's entry in the file
.git/config.


These steps can be automated using the commands:

```
rm -rf .git/modules/<path-to-submodule>, and
git config --remove-section submodule.<path-to-submodule>.
```

 - [git - How do I remove a submodule - Stack Overflow](https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule)

## Move submodule

    git mv old/submod new/submod

## When upstream repository changes URL of submodule in the .gitmodules file

Copy the new URL to your local config

    $ git submodule sync --recursive:

Update the submodule from the new URL:

    $ git submodule update --init --recursive

## Switching from subdirectories to submodules

If you delete the subdirectory and then run submodule add, Git yells at you.

    $ rm -Rf CryptoLibrary/
    $ git submodule add https://github.com/chaconinc/CryptoLibrary
    'CryptoLibrary' already exists in the index

Unstage the CryptoLibrary directory first, then add the submodule:

    $ git rm -r CryptoLibrary
    $ git submodule add https://github.com/chaconinc/CryptoLibrary
    Cloning into 'CryptoLibrary'...
    remote: Counting objects: 11, done.
    remote: Compressing objects: 100% (10/10), done.
    remote: Total 11 (delta 0), reused 11 (delta 0)
    Unpacking objects: 100% (11/11), done.
    Checking connectivity... done.

## Misc commands

submodule foreach:

    git submodule foreach 'git stash'
