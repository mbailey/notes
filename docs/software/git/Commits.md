# Commits

- [Commit References](git-commit-references.md): Refer to commits relative to head ( e.g. `HEAD^^`, `HEAD~5`)


Show commit summary:

```shell
git show --stat
```

Stage non-whitespace changes ([ref](https://stackoverflow.com/a/45486981)):

```shell
git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -
```


**List files in change**: 

```shell
git show --name-only --pretty=format:
```


## List merge conflicts


```shell
git diff --name-only --diff-filter=U
```
