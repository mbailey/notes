# Remove large file with git filter-repo

**[100 times faster than git filter-branch and simpler (stackoverflow.com)](https://stackoverflow.com/a/61602985/660017)**

## git filter-repo

`git filter-repo` ([github][1]) is a versatile tool for rewriting history. It is now recommended by the git project instead of `git filter-branch`.

git-filter-repo is a single-file python script, which was done to make installation for basic use on many systems trivial: just place the script into your $PATH.

Installation is as easy as:

    $ PACKAGE_TOOL install git-filter-repo

[1]: https://github.com/newren/git-filter-repo

> Warning: Do this on a copy of your repository. Many actions of filter-repo cannot be undone. filter-repo will change the commit hashes of all modified commits (of course) and all their descendants down to the last commits!

First you can run:

    git filter-repo --analyze

This helps you to determine what to do next.

 ![Pasted image 20230128143028](../../assets/Pasted%20image%2020230128143028.png)

You can delete your big mp3 file everywhere:

    git filter-repo --invert-paths --path-match bigfile.mp3



