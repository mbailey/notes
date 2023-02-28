# make

- [GNU make (www.gnu.org)](https://www.gnu.org/software/make/manual/make.html)

## Bash Completion

Add this in your ~/.bash_profile file or ~/.bashrc file:

```shell
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
```
