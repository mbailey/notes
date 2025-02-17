# podman


**Write to a local file from podman container:**

```bash
podman run --rm \
  -v "$(pwd)":/work \
  -w /work \
  alpine \
  touch newfile.txt
```



Give me a shell on debian: 

```shell
podman run -it debian /bin/bash
```

