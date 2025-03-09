---
alias: Relative Symlinks
---
# Relative Symlinks

Relative symlinks, when created using `ln -sr`, store a path calculated from the real (absolute) path of the symlink's location to the real path of the target, ensuring accuracy regardless of intervening symlinks or the manner of accessing the symlink.

Symlinks are awesome but logical/physical paths can trip you up.
## Puzzle

What do you think `ls -la ../` will show? (Number 3 might surprise you)

**1. Inspect a dir with a symlinked dir in it.**

```
m@x2 .deleteme$ pwd
/home/alex/.deleteme
m@x2 .deleteme$ pwd -P
/home/alex/.deleteme
m@x2 .deleteme$ ls -la
total 44
drwxr-xr-x.  3 m m 20480 Jul 23 11:19 .
drwxr-x---+ 98 m m 12288 Jul 23 10:52 ..
drwxr-xr-x.  8 m m  4096 Feb 26 13:45 .old
-rw-r--r--.  1 m m     0 Jul 23 11:18 THIS_IS_DELETEME_DIR.txt
lrwxrwxrwx.  1 m m    42 Jul 23 11:19 example-repo -> ../Code/github.com/orgname/example-repo
```

**2. `cd` to the symlinked dir**

```
m@x2 .deleteme$ cd example-repo
m@x2 example-repo $ pwd
/home/alex/.deleteme/example-repo
m@x2 example-repo $ pwd -P
/home/alex/Code/github.com/org/example-repo
```

**3. What is `ls -la ../` going to show?**

```shell
m@x2 example-repo $ ls -la ../
``` 

## Answer


`ls ../` shows us contents of the parent directory of the *physical path*:

```
m@x2 example-notes $ ls ../
example example-foo           example-foo-dirsync  
```

But tab completion when trying to create a symlink to a target in the parent dir shows contents of *logical path* parent dir:

```
m@x2 example-notes (main stash:1 4 months ago)$ ln -s ../
date                      .old/                     THIS_IS_DELETEME_DIR.txt  example-notes/
```


If we create that, it will create a *dangling (broken) link:

```          
m@x2 example-notes $ ln -s ../THIS_IS_DELETEME_DIR.txt .
m@x2 example-notes $ symlinks -tv .
dangling: /home/m/Code/github.com/work/example-notes/THIS_IS_DELETEME_DIR.txt -> ../THIS_IS_DELETEME_DIR.txt
```

## See also:

- [ls - POSIX (pubs.opengroup.org)](https://pubs.opengroup.org/onlinepubs/009696799/utilities/ls.html)
- [Claude 3.5 Sonnet needed guidance](Claude%203.5%20Sonnet%20needed%20guidance.md)
