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
