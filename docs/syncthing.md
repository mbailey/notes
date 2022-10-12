# Syncthing

> Syncthing is a **continuous file synchronization** program. It synchronizes files between two or more computers in real time, safely protected from prying eyes. Your data is your data alone and you deserve to choose where it is stored, whether it is shared with some third party, and how it's transmitted over the internet.
>
> - [Syncthing](https://syncthing.net/)

- [Is putting a Git workspace in a synced folder really a good idea? (forum.syncthing.net)](https://forum.syncthing.net/t/is-putting-a-git-workspace-in-a-synced-folder-really-a-good-idea/1774)

firewalld:

    sudo firewall-cmd --zone=public --add-service=syncthing --permanent
    sudo firewall-cmd --reload
