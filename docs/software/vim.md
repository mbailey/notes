# vim

### Howto

### Remove trailing whitespace

1. On current line:
```vim
:s/\s\+$//
```

2. On all lines in the file:
```vim
:%s/\s\+$//e
```
(The 'e' flag prevents error messages if no trailing spaces are found)

3. On selected lines:
- First, visually select the lines (V)
- Then apply the substitution to the selection:
```vim
:'<,'>s/\s\+$//
```


#### Disable modelines (security risk)

Add to ~/.vimrc

    " [security](https://www.techrepublic.com/article/turn-off-modeline-support-in-vim/)
    set modelines=0
    set nomodeline

#### Make VIM default editor

    dnf install -y --allowerasing vim-default-editor

# Delete all comments

    :g/^#/d

# Delete all blank lines

    :g/^$/d

### redhat / centos vi sucks

    # ~/.bashrc
    alias vi=vim

### Set default editor on ubuntu

    sudo update-alternatives --config editor
