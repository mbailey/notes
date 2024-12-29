# git-lfs


## lfs

    git lfs ls-files --all

Remove from lfs

    git lfs untrack '<file-type>'
    git rm --cached '<file-type>'
    git add '<file-type>'
    git commit -m "restore '<file-type>' to git from lfs"

## See also

- https://gregoryszorc.com/blog/2021/05/12/why-you-shouldn%27t-use-git-lfs/
    - performance