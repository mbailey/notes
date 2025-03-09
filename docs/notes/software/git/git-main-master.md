# Change default branch  from main to master

Remembering whether default branch is `master` or `main` can be taxing.

## Update GitHub

**Update on GitHub.com:** Settings -> General -> Default branch

## Update local repositories

```shell
git branch -m main <BRANCH>
git fetch origin
git branch -u origin/<BRANCH> <BRANCH>
git remote set-head origin -a
```