# Obsidian performance

## Questions

- How do I find out why Obsidian is findinf so many files it can't use? #AI!

## Tasks

- Write a script to find identify why non-document files are slowing down startup #AI!

## Enable "Notify if startup takes longer than expected"

This is good!
The problem appears to be the 54,199 files (only ~8000 documents).

### Enable Option and re-open Obsidian

Options -> General -> Advanced -> Notify if startup takes longer than expected

## With community plugins disabled

```
Obsidian start-up time breakdown

Obsidian version: v1.8.0
Installer version: v1.4.13
Operating system: #1 SMP PREEMPT_DYNAMIC Thu Dec 19 23:18:14 UTC 2024 6.12.6-100.fc40.x86_64

- Total startup time: 15,483ms
- Initialization: 1,435ms
- Vault (54,199 files): 12,974ms
- Workspace (10 tabs, 9 deferred): 976ms
- Core plugins: 99ms
```


## With community plugins enabled

```
Obsidian start-up time breakdown

Obsidian version: v1.8.0
Installer version: v1.4.13
Operating system: #1 SMP PREEMPT_DYNAMIC Thu Dec 19 23:18:14 UTC 2024 6.12.6-100.fc40.x86_64

- Total startup time: 20,909ms
- Initialization: 1,683ms
- Vault (54,199 files): 16,769ms
- Workspace (10 tabs, 8 deferred): 992ms
- Core plugins: 78ms
- Community plugins (19 active): 1,386ms
  - Emoji Toolbar (v0.4.1): 385ms
  - Diagrams (v1.5.0): 305ms
  - Dataview (v0.5.67): 116ms
  - Templater (v2.4.2): 89ms
  - Banners (v1.3.3): 81ms
  - Note Refactor (v1.8.2): 68ms
  - Emoji Autocomplete (v1.4.1): 51ms
  - Plaintext (v0.2.0): 37ms
  - Emoji Shortcodes (v2.2.0): 33ms
  - Whisper (v1.5.5): 32ms
  - Homepage (v3.8.0): 27ms
  - Image Toolkit (v1.4.1): 22ms
  - Calendar (v1.5.10): 19ms
  - Paste URL into selection (v1.7.0): 16ms
  - Hotkeys for templates (v1.4.3): 13ms
  - Periodic Notes (v0.0.17): 13ms
  - Paste image rename (v1.6.1): 11ms
  - Recent Files (v1.4.2): 7ms
  - Image Context Menus (v1.9.0): 6ms
```


## Remote debugging with web browser devtools 

Haven't explored how to use this.

```shell
Obsidian.AppImage --enable-logging --remote-debugging-port=9222
```
