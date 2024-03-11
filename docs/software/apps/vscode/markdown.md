# Markdown in VS Code

- [Markdown editing with Visual Studio Code (code.visualstudio.com)](https://code.visualstudio.com/docs/languages/markdown)

- [Doc Writer Profile Template (code.visualstudio.com)](https://code.visualstudio.com/docs/editor/profiles#_doc-writer-profile-template)

## Tasks

- [ ] Create workspace settings

## Hyperlinks

- Path completion built in
- Type `##` in a link to see list of all Markdown headers in workspace
- Drag file from explorer to create link to it.

### Automatic link updates on file move or rename
- [Automatic link updates on file move or rename](https://code.visualstudio.com/docs/languages/markdown#_automatic-link-updates-on-file-move-or-rename)

```json
"markdown.updateLinksOnFileMove.enabled": "prompt",
```

markdown.updateLinksOnFileMove.enabled: prompt

Automatic link updating detects renames of Markdown files, images, and directories. You can enable it for additional file types with `markdown.updateLinksOnFileMove.include`

## Pasting files

- [Visual Studio Code May 2023 (code.visualstudio.com)](https://code.visualstudio.com/updates/v1_79#_copy-external-media-files-into-workspace-on-drop-or-paste-for-markdown)

- [x] You can paste a file from the clipboard into your workspace and automatically link from documents. This is great for adding screenshots, pdfs, etc. ✅ 2024-03-11

The `markdown.copyFiles.destination` setting controls where the new image file should be created

- [ ] Put ***pasted*** assets into `./assets/`
```
"markdown.copyFiles.destination": {
		"/**/*": "assets/"
}
```

## Keep trailing whitespace
```
{
  "[markdown]": {
    "files.trimTrailingWhitespace": false
  }
}
```
## Shortcuts

`Ctrl+Shift+O`: Go to header in file  

