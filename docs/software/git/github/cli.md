# Github CLI

- https://cli.github.com

## Extensions

- [gh-dash (dlvhdr.github.io)](https://dlvhdr.github.io/gh-dash/): A GitHub (`gh`) CLI extension to display a dashboard with **pull requests** and **issues** by filters you care about.


## Delete workflows

```shell
$ for x in $(gh run list --branch debug-github-workflow | cut -f7); do echo $x; gh run delete $x -R some_dir ; done
1263336875
✓ Request to delete workflow submitted.
3364456389
✓ Request to delete workflow submitted.
3352638368
✓ Request to delete workflow submitted.
4336276464
```
`






