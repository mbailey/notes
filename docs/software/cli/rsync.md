# rsync

**Change user on remote host (to access their homedir):**

    rsync -avz --rsync-path 'sudo -u someuser rsync' somehost:files/ somehost-files/


**Don't copy files Git ignores:**

    rsync -avz --filter=':- .gitignore' foo remote_host:bar

**Create parent folders on target**:

```shell
rsync -av --relative .config/Code/User/settings.json ../dotfiles-global/
```


## ext4 -> exfat

```shell
rsync \
  -rtv \
  --progress \
  --modify-window=1 \
  --no-perms \
  --no-owner \
  --no-group \
  --filter='- */overlay/*' \
  --filter='- *overlay*' \
  EXT4_VOLUME EXFAT_VOLUME
```