# Git - Find deleted files

`git log --diff-filter=D -- docs/chicken.md`

By Claude.ai

To find a file in a Git repository that was deleted at some point, you can use the `git log` command with some specific options. Here's a concise approach:

1. Use `git log --all --full-history -- "*/<file_path>"`:

```
git log --all --full-history -- "*/<file_path>"
```

Replace `<file_path>` with the path to the file you're looking for. This command will show you the commit history for that file, including when it was deleted.

2. Once you find the commit where the file existed, you can checkout that specific commit to see the file contents:

```
git checkout <commit_hash> -- <file_path>
```

This will restore the file to your working directory.

If you need more details on interpreting the output or using these commands, I'd be happy to elaborate further.