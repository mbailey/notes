---
alias: Obsidian
---
# Obsidian

- https://forum.obsidian.md/t/support-gfm-style-kebab-case-heading-slug-anchor-targets/30350 GFM links for headings
- [manual (help.obsidian.md)](https://help.obsidian.md/)
- [date formatting](https://momentjs.com/docs/#/displaying/format/)
- [A Few of Our Favorite Obsidian Plugins – The Sweet Setup](https://thesweetsetup.com/our-favorite-obsidian-plugins/)

- [Settings that may break quick switcher and link completer](obsidian-settings-that-may-break-quick-switcher-and-link-completer.md)
## Questions

## Tasks

- Review top ten plugins
- Make clicking a link in my second brain open Slack
- Open "sub-vaults" (e.g. "work" to not show personal at work)

## Features

- Updates links when you move/rename files
- Extract current selection
- Extract this Heading

## Install

```shell
$ ./bin/obsidian-install.sh
https://github.com/obsidianmd/obsidian-releases/releases/download/v0.15.9/Obsidian-0.15.9.AppImage
install ok
```

## Config

User
Workspace

### Plugins

- [obsidianmd/obsidian-sample-plugin](https://github.com/obsidianmd/obsidian-sample-plugin)
- [mgmeyers/obsidian-kanban Create markdown-backed Kanban boards in Obsidian.](https://github.com/mgmeyers/obsidian-kanban)

## Hotkeys

All are settable.

- `ctrl + o` : Open quick switcher
- `ctrl + p` : Open command palette
- `ctrl + ,` : Open settings
- `ctrl b ,` : Toggle bold

## Sync

Tools for Sync'ing:

- [SyncThing](https://syncthing.net/) is free and works well between computers. Data stays on your hardware.
- [Obsidian Sync](https://obsidian.md/sync): USD $10 per month. Supports end to end encryption.
- [Git](https://git-scm.com/): Open Source and free source control.
    - changing between branches can lead to a lot of sync updates

### Note

- Sync conflicts will likely result from using Obsidian Sync with another type (like SyncThing).
    - Setting "Open Daily Note at Startup" to true on multiple hosts will likely cause sync issues. [forum.obsidian.com](https://forum.obsidian.md/t/obsidian-sync-updates-from-one-device-overwritten-by-another/33007)

linux  <--> linux : Obsidian Sync or SyncThing, Git
iphone <--> linux : Obsidian Sync



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

