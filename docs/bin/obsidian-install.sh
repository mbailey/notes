#!/usr/bin/env bash
#
# obsidian-install.sh
#
# https://forum.obsidian.md/t/gnome-desktop-installer/499

set -euo pipefail

dl_url=$(
  curl --silent https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest  \
	| grep "browser_download_url.*AppImage" | tail -n 1 | cut -d '"' -f 4 )

echo $dl_url

if [[ -z "$dl_url" ]]; then
	echo "missing download link"
    echo "usage: install-obsidian.sh <download url>"
    exit 1
fi

curl --silent --location --output Obsidian.AppImage "$dl_url"

sudo mkdir --parents /opt/obsidian/
sudo mv Obsidian.AppImage /opt/obsidian
sudo chmod u+x /opt/obsidian/Obsidian.AppImage

echo "[Desktop Entry]
Type=Application
Name=Obsidian
Exec=/opt/obsidian/Obsidian.AppImage
Icon=obsidian
Terminal=false" > ~/.local/share/applications/obsidian.desktop

update-desktop-database ~/.local/share/applications

# Setup app image - broken
# tempdir=$(mktemp -d)
# cd $tempdir
# /opt/obsidian/Obsidian.AppImage --appimage-extract
# rsync -av $tempdir/squashfs-root/usr/share/icons/hicolor/ /home/m/.local/share/icons/hicolor/
# cd ~/.local/share/icons/hicolor/
# touch index.theme
# echo -e "[Icon Theme]\nName=hicolor" >> index.theme
# gtk-update-icon-cache ~/.local/share/icons/hicolor/

echo "install ok"
