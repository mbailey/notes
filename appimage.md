# AppImage

AppImage: Self-contained, immutable,  portable Linux applications that run without installation or dependencies.

## When I run `Obsidian` desktop app on my fedora laptop:

It executes `/opt/obsidian/Obsidian.AppImage %u`:

```shell
$ cat ~/.local/share/applications/obsidian.desktop 
[Desktop Entry]
Type=Application
Name=Obsidian
Exec=/opt/obsidian/Obsidian.AppImage %u
Icon=obsidian
Terminal=false
MimeType=x-scheme-handler/obsidian;text/html;
```

This is symlinked to downloaded AppImage:

```shell
$ ls -la /opt/obsidian/
total 318804
drwxr-xr-x.  3 root root      4096 Feb  1 16:09 .
drwxr-xr-x. 24 root root      4096 Dec 16 13:38 ..
drwxr-xr-x.  3 root root      4096 Sep 18  2023 deleteme
-rwxr-xr-x.  1 m    m    105411110 Sep 18  2023 Obsidian-1.4.13.AppImage
-rwxr-xr-x   1 m    m    116559616 Jan 31 18:54 Obsidian-1.8.3.AppImage
lrwxrwxrwx   1 root root        23 Feb  1 16:09 Obsidian.AppImage -> Obsidian-1.8.3.AppImage
-rwxr--r--.  1 m    m    104455127 Aug  5  2023 Obsidian.AppImage-20230918

```

