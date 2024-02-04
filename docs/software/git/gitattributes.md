# gitattributes

## global attributesfile location

**Get**:

```bash
git config --get core.attributesfile
```

**Set**:
```shell
git config --global core.attributesfile '~/.gitattributes'
```

Check git attributes:

```bash
git check-attr -a --all
```

## Scope

single repo, all users:  
    `$GIT_DIR/info/attributes`

all repos, single user:  
    `${XDG_CONFIG_HOME:-${HOME}/.config}/git/attributes`

all repos, all users:
    `$(prefix)/etc/gitattributes`

> If you wish to affect only a single repository (i.e., to assign attributes to files that are particular to one user’s workflow for that repository), then attributes should be placed in the $GIT_DIR/info/attributes file. Attributes which should be version-controlled and distributed to other repositories (i.e., attributes of interest to all users) should go into .gitattributes files. Attributes that should affect all repositories for a single user should be placed in a file specified by the core.attributesFile configuration option (see git-config(1)). Its default value is $XDG_CONFIG_HOME/git/attributes. If $XDG_CONFIG_HOME is either not set or empty, $HOME/.config/git/attributes is used instead. Attributes for all users on a system should be placed in the $(prefix)/etc/gitattributes file.
> - `man gitattributes`
