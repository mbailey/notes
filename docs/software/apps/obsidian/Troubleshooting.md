# Troubleshooting

- [Troubleshoot Obsidian Sync - Obsidian Help (publish.obsidian.md)](https://publish.obsidian.md/)


## Testing sync

1. Create some test files:

```shell
touch ~/Notes/{,public/,personal/,work/}test-$(datestamp).md
```

2. Check Obsidian sync log on other devices.
3. Check the files

## File count

It's a bit hard to match them if you're not sure what filetypes are being synced.


**Linux:**
```shell
$ fd .md | wc -l
5491
```

**iOS:**
Files and dirs are listed 