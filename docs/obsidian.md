# Obsidian

- [manual (help.obsidian.md)](https://help.obsidian.md/)
- [date formatting](https://momentjs.com/docs/#/displaying/format/)
- [A Few of Our Favorite Obsidian Plugins – The Sweet Setup](https://thesweetsetup.com/our-favorite-obsidian-plugins/)

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

## Commands

- `ctrl + o` : Open quick switcher
- `ctrl + p` : Open command palette
- `ctrl + ,` : Open settings

## Sync

Tools for Sync'ing:

- [SyncThing](https://syncthing.net/) is free and works well between computers. Data stays on your hardware.
- [Obsidian Sync](https://obsidian.md/sync): USD $10 per month. Supports end to end encryption.
- [Git](https://git-scm.com/): Open Source and free source control.

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

## Editing

Helps you find link targets:

![](Pasted%20image%2020220815122305.png)

## Multiple Vaults

I'd prefer to have multiple vaults open instead of having to keep switching.

- Feature request  [“Same Window” and “New Window” options for open vault](https://forum.obsidian.md/t/same-window-and-new-window-options-for-open-vault/4074)


## Example of website you can generate

https://help.obsidian.md/How+to/Internal+link

![](Pasted%20image%2020220815092829.png)
