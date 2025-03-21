# git ignore


## Global Ignore Rules

```
git config --global core.excludesfile ~/.gitignore_global
echo '*sync-conflict*' >> ~/.gitignore_global
```

### Check which rule caused git to ignore

    git check-ignore -v path/to/check

## Ignore some local changes

- [How do I configure git to ignore some files locally - Stack Overflow (stackoverflow.com)](https://stackoverflow.com/questions/1753070/how-do-i-configure-git-to-ignore-some-files-locally/1753078#1753078)

> Patterns which are specific to a particular repository but which do not need to be shared with other related repositories (e.g., auxiliary files that live inside the repository but are specific to one user's workflow) should go into the `$GIT_DIR/info/exclude` file.

Note, if you already have unstaged changes you must run the following after editing your ignore-patterns:
```
git update-index --assume-unchanged <file-list>
```


## Ignore local changes

Tell Git to ignore changes to a file locally without affecting the repository or other collaborators:

```shell
git update-index --assume-unchanged path/to/file
```

List affected files with:

```shell
git ls-files -v | grep '^h'
```

Undo with:
```shell
git update-index --no-assume-unchanged path/to/file
```

## Global Ignore file

```bash
$ touch ~/.gitignore
$ git config --global core.excludesFile ~/.gitignore
```

## List ignored files under current dir

```
git clean -n -X
```


### Which file to place a pattern in depends on how the pattern is meant to be used.

•   Patterns which should be version-controlled and distributed to other repositories via clone (i.e., files that all developers will
    want to ignore) should go into a .gitignore file.

•   Patterns which are specific to a particular repository but which do not need to be shared with other related repositories (e.g.,
    auxiliary files that live inside the repository but are specific to one user’s workflow) should go into the $GIT_DIR/info/exclude
    file.

•   Patterns which a user wants Git to ignore in all situations (e.g., backup or temporary files generated by the user’s editor of
    choice) generally go into a file specified by core.excludesFile in the user’s ~/.gitconfig. Its default value is
    $XDG_CONFIG_HOME/git/ignore. If $XDG_CONFIG_HOME is either not set or empty, $HOME/.config/git/ignore is used instead.

### gitignore (and gitattributes) PATTERN FORMAT

•   A blank line matches no files, so it can serve as a separator for readability.

•   A line starting with # serves as a comment. Put a backslash ("\") in front of the first hash for patterns that begin with a hash.

•   Trailing spaces are ignored unless they are quoted with backslash ("\").

•   An optional prefix "!" which negates the pattern; any matching file excluded by a previous pattern will become included again. It
    is not possible to re-include a file if a parent directory of that file is excluded. Git doesn’t list excluded directories for
    performance reasons, so any patterns on contained files have no effect, no matter where they are defined. Put a backslash ("\") in
    front of the first "!" for patterns that begin with a literal "!", for example, "\!important!.txt".

•   The slash / is used as the directory separator. Separators may occur at the beginning, middle or end of the .gitignore search
    pattern.

•   If there is a separator at the beginning or middle (or both) of the pattern, then the pattern is relative to the directory level of
    the particular .gitignore file itself. Otherwise the pattern may also match at any level below the .gitignore level.

•   If there is a separator at the end of the pattern then the pattern will only match directories, otherwise the pattern can match
    both files and directories.

•   For example, a pattern doc/frotz/ matches doc/frotz directory, but not a/doc/frotz directory; however frotz/ matches frotz and
    a/frotz that is a directory (all paths are relative from the .gitignore file).

•   An asterisk "*" matches anything except a slash. The character "?" matches any one character except "/". The range notation, e.g.
    [a-zA-Z], can be used to match one of the characters in a range. See fnmatch(3) and the FNM_PATHNAME flag for a more detailed
    description.

Two consecutive asterisks ("**") in patterns matched against full pathname may have special meaning:

•   A leading "**" followed by a slash means match in all directories. For example, "**/foo" matches file or directory "foo" anywhere,
    the same as pattern "foo". "**/foo/bar" matches file or directory "bar" anywhere that is directly under directory "foo".

•   A trailing "/**" matches everything inside. For example, "abc/**" matches all files inside directory "abc", relative to the
    location of the .gitignore file, with infinite depth.

•   A slash followed by two consecutive asterisks then a slash matches zero or more directories. For example, "a/**/b" matches "a/b",
    "a/x/b", "a/x/y/b" and so on.

•   Other consecutive asterisks are considered regular asterisks and will match according to the previous rules.


