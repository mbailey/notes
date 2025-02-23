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


## See also

- http://vimcasts.org/ 
- Book [Practical Vim, Second Edition Edit Text at the Speed of Thought by Drew Neil (pragprog.com)](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/)

### Primetimegen

- [Vim As Your Editor by ThePrimeagen - Oct 2022 (youtube.com)](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)
- [Vim As You Editor - Advanced Motions P1 - YouTube (www.youtube.com)](https://www.youtube.com/watch?v=qZO9A5F6BZs)

<iframe width="560" height="315" src="https://www.youtube.com/embed/X6AR2RMB5tE?si=nSNg419tFthPqCay" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>