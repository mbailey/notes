# xargs

Where the argument you pass in using xargs isn't at the last argument:

```shell
ls  -tr1  |  tail  -5  |  xargs  -i  cp  '{}'  dest/folder/
```
