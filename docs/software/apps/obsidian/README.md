---
alias: Obsidian
---
# Obsidian

- [sync](sync.md)


## Cool stuff

- [bookmarklets](bookmarklets.md)
- https://github.com/sytone/obsidian-remote
- [List files reverse alphabetical](List%20files%20reverse%20alphabetical.md)(?)
- [Collaborate on a shared vault (publish.obsidian.md)](https://publish.obsidian.md/)
- [emoji](emoji.md)
## Questions

- How can each user manage their own preferences for a shared repo in Git?
- Issue: [Color scheme adapt to system not working on Linux (FedoraGNOME) - Bug graveyard - Obsidian Forum (forum.obsidian.md)](https://forum.obsidian.md/t/color-scheme-adapt-to-system-not-working-on-linux-fedora-gnome/38743/40)

## Tasks

- Put my standard .obsidian dir somewhere I can pull as template
- Obsidian open Notes in GitHub https://chat.openai.com/share/e/82d4710d-6fea-4c3e-9597-62b7ac9bf293
- [ ] Put global settings somewhere public
- Obsidian Copilot with Ollama
- Plugin to copy path to note to clipboard
- Auto-add title based on filename
- Add alias for files called README.md
- Review top ten plugins
- Make clicking a link in my second brain open Slack
- Open "sub-vaults" (e.g. "work" to not show personal at work)

## Features

- Updates links when you move/rename files
- Extract current selection
- Extract this Heading

## Install

### Fedora

```shell
$ ./bin/obsidian-install.sh
https://github.com/obsidianmd/obsidian-releases/releases/download/v0.15.9/Obsidian-0.15.9.AppImage
install ok
```

### macOS




## Config

User
Workspace

## Plugins

- Advanced Slides
- **Markdown to Slack:** [idreamer/markdown-to-slack-message (github.com)](https://github.com/idreamer/markdown-to-slack-message)
- **Recent Files:** [tgrosinger/recent-files-obsidian](https://github.com/tgrosinger/recent-files-obsidian)

- **Obsidian Sample Plugin:** [obsidianmd/obsidian-sample-plugin](https://github.com/obsidianmd/obsidian-sample-plugin)
- **Obsidian Kanban:** [mgmeyers/obsidian-kanban Create markdown-backed Kanban boards in Obsidian.](https://github.com/mgmeyers/obsidian-kanban)

## Hotkeys

Obsidian Keyboard Shortcuts are known as "Hotkeys".

# convert this list to a markdown table ai!
- `ctrl + o` : Open quick switcher
- `ctrl + p` : Open command palette
- `ctrl + ,` : Open settings
- `ctrl b ,` : Toggle bold
- TBA: toggle code
- TBA: toggle checkboxes
- TBA: toggle headings




## Templates

### `date` Snippet

I run `Ctrl+T`,  `d`,  `Enter` to insert `Thu 25 Aug 2022 05:04:15`.

Enable `Templates` plugin (Core Plugin) and enable it.  
Configure templates directory (through Settings or  .obsidian/templates.json):

```json
{
  "folder": "Templates"
}
```

 Create `Templates/d.md`:

```markdown
{{date:ddd DD MMM YYYY HH:mm:ss}}
```

Configure Hotkey (through Settings or .obsidian/hotkeys.json) :

```json
{
  "insert-template": [
    {
      "modifiers": [
        "Mod"
      ],
      "key": "T"
    }
  ]

}
```

## Multiple Vaults

I'd prefer to have multiple vaults open instead of having to keep switching.

- Feature request  [“Same Window” and “New Window” options for open vault](https://forum.obsidian.md/t/same-window-and-new-window-options-for-open-vault/4074)

## Example of website you can generate



## Shortcuts (ios, macos
)
https://www.carlcassar.com/articles/five-useful-apple-shortcuts-for-obsidian

- siri today: opens daily note
- Make one to append

- [No Boilerplate]()
https://youtube.com/watch?v=DbsAQSIKQXk&si=TmwCea_05YzeDyvA)

## See also

- https://forum.obsidian.md/t/support-gfm-style-kebab-case-heading-slug-anchor-targets/30350 GFM links for headings
- [manual (help.obsidian.md)](https://help.obsidian.md/)
- [date formatting](https://momentjs.com/docs/#/displaying/format/)

- [Settings that may break quick switcher and link completer](obsidian-settings-that-may-break-quick-switcher-and-link-completer.md)

- [Plugins](plugins/README.md)
  - [A Few of Our Favorite Obsidian Plugins – The Sweet Setup](https://thesweetsetup.com/our-favorite-obsidian-plugins/)