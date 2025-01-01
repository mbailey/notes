# watch-files

Signal Aider from your editor (e.g. Obsidian, VSCode).

![demo](https://private-user-images.githubusercontent.com/87852832/399141384-94eb7184-3d1d-432e-a052-2f14286a3628.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU2ODg4OTAsIm5iZiI6MTczNTY4ODU5MCwicGF0aCI6Ii84Nzg1MjgzMi8zOTkxNDEzODQtOTRlYjcxODQtM2QxZC00MzJlLWEwNTItMmYxNDI4NmEzNjI4LmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjMxVDIzNDMxMFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTA0NWQ3NWY4ODBhYzJiMzZkM2NkNzQzYWIyNWNkMTQ0YzUwYjQwYjk0NGI5YThjNzNmZTg5MWM3YTg4YTc3YjgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.Y6wh5299HhTorFMLu0xhamZKna9CwH3oxbVXNcFrVsI)


## Steps

### 1. Start Aider with `--watch-files`

```shell
$ aider --watch-files
```

### 2. Signal Aider with AI? or AI! in a comment

- `AI?`: Question
- `AI!`: Task

Example of signalling Aider from a Markdown document.

```markdown
# Obsidian performance

## Questions

- How do I find out why Obsidian is finding so many files it can't use? #AI?

## Tasks

- Write a script to find identify why non-document files are slowing down startup #AI!
```