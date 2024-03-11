# git config

## Open config in editor

Git config for current repo is not always in `.git/config` (e.g. when using submodules).

```text
git config -e
```

### diff gpg

- [How to show diffs for gpg-encrypted files](https://gist.github.com/marceloalmeida/e6593b93b388cdf1dbc282dffd424d1b#file-readme-md)

Update `.gitattributes` in repo:

```shell
echo "*.gpg filter=gpg diff=gpg" >> .gitattributes
echo "*.asc filter=gpg diff=gpg" >> .gitattributes
```

Tell Git to decrypt GPG files before diff'ing them (use `--local` for current repo only):

```shell
$ git config --global diff.gpg.textconv "gpg --no-tty --decrypt"
$
```


Don't ask me to run `git push --set-upstream origin`.  Rather than ask me where to push new branches:

```shell
git config --global push.default current
```

## Disable gpg signing for current repo

```
git config --local commit.gpgsign false
```


## Override $EDITOR for commits

Don't use `code` for commits.

```
git config --global core.editor "vim"
```


## Global user config

--global

For writing options: write to global `~/.gitconfig` file rather than the repository `.git/config`, write to `$XDG_CONFIG_HOME/git/config` file if this file exists and the `~/.gitconfig` file doesn’t.

For reading options: read only from global `~/.gitconfig` and from `$XDG_CONFIG_HOME/git/config` rather than from all available files.