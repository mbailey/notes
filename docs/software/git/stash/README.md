# git stash

- [Conflict Resolution](Conflict%20Resolution.md)


```
list
show [-p] [stash@{n}] -- [path]

apply
pop
drop stash@{0}

branch
clear: remove all
create
push
```

## List with dates

```shell
git stash list --pretty=format:"%C(auto)%h %<(15)%gd %<(10)%cr %s"
```




## Back out of a merge

```shell
git reset --merge
```

## Show diff

git stash show -p
git stash show -p stash@{n}



