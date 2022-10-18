# Git submodules

Git clone with submodules:

    git clone --recurse-submodules https://github.com/chaconinc/MainProject

Did you forget to clone with submodules?

    git submodule init
    git submodule update

Update submodules in repo:

    git submodule update --remote [--merge]

### Add submodule to repository

- [Using submodules in Git - (vogella.com)](https://www.vogella.com/tutorials/GitSubmodules/article.html#submodules_trackbranch)

> Adding a submodule to a Git repository and tracking a branch
>
> If you add a submodule, you can specify which branch should be tracked via
> the -b parameter of the submodule add command. The git submodule init command
> creates the local configuration file for the submodules, if this
> configuration does not exist.
>

    git submodule add -b master git@github-mbailey:mbailey/notes.git public
    git submodule init

> If you track branches in your submodules, you can update them via the
> --remote parameter of the git submodule update command. This pulls in new
> commits into the main repository and its submodules. It also changes the
> working directories of the submodules to the commit of the tracked branch.

    # update your submodule --remote fetches new commits in the submodules
    # and updates the working tree to the commit described by the branch
    #
    git submodule update --remote

### Remove submodule from repository

- [git - How do I remove a submodule - Stack Overflow](https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule)

> In modern git (I'm writing this in 2022, with an updated git installation),
> this has become quite a bit simpler:
>
>    Run git rm <path-to-submodule>, and commit.
>
> This removes the filetree at <path-to-submodule>, and the submodule's entry
> in the .gitmodules file. I.e. all traces of the submodule in your repository
> proper are removed.
>
> As the docs note however, the .git dir of the submodule is kept around (in
> the modules/ directory of the main project's .git dir), "to make it possible
> to checkout past commits without requiring fetching from another repository".
> If you nonetheless want to remove this info, manually delete the submodule's
> directory in .git/modules/, and remove the submodule's entry in the file
> .git/config.
>
> These steps can be automated using the commands:
>
>   rm -rf .git/modules/<path-to-submodule>, and
>   git config --remove-section submodule.<path-to-submodule>.



## git filter-repo

`git filter-repo` ([github][1]) is a versatile tool for rewriting history. It is now recommended by the git project instead of `git filter-branch`.

git-filter-repo is a single-file python script, which was done to make installation for basic use on many systems trivial: just place the script into your $PATH.

Installation is as easy as:

    $ PACKAGE_TOOL install git-filter-repo

[1]: https://github.com/newren/git-filter-repo

## Remove file:

  # git recommends using [git-filter-repo](https://github.com/newren/git-filter-repo/#simple-example-with-comparisons)

    git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch path_to_file" HEAD


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
