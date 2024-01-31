# markdown-link-check

npm package providing CLI tool and libraries for checking links in Markdown files.

- [tcort/markdown-link-check checks all of the hyperlinks in a markdown text to determine if they are alive or dead (github.com)](https://github.com/tcort/markdown-link-check)

#### Install

```shell
npm install -g markdown-link-check
```

#### Usage

```shell
$ markdown-link-check README.md 

FILE: README.md
  [✓] https://mike.bailey.net.au/notes
  [✓] https://github.com/mbailey/notes/blob/master/notes.sh
  [✓] docs/fast-learning.md
  [✓] https://www.youtube.com/embed/N5b4_5hvOog

  4 links checked.
```
**Recursive**:  

```shell
find . -name \*.md -print0 | xargs -0 -n1 markdown-link-check
```


**Bash function**:

Check given directory (defaults to current)
```shell
markdown-link-check-dir ()  { 
    cd "${1:-.}";
    find . -name \*.md -print0 | xargs -0 -n1 markdown-link-check -q
}
```

**Alias**:

- Only report on problems
- Don't treat unauthenticated as a broken link

```shell
markdown-link-check -q --alive 200,403'
```