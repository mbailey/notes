# tee



```
```bash
command > >(tee -a stdout.log) 2> >(tee -a stderr.log >&2)
```

- https://stackoverflow.com/a/692407