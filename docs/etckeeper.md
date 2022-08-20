# etckeeper

etckeeper creates a git repo in /etc and automatically commits
the work of scoundrels who make config changes in prod.

- [etckeeper.branchable.com](https://etckeeper.branchable.com/)

## Fedora

    sudo dnf -y install etckeeper

    git config --global user.email || git config --global user.email "you@example.com"
    git config --global user.name || git config --global user.name "Your Name"

    etckeeper init
    etckeeper vcs status
    etckeeper vcs commit -m 'msg'

## Redhat

    sudo yum install etckeeper
    cd /etc
    sudo etckeeper init
    sudo etckeeper commit "First commit of my /etc directory"

## ubuntu

    sudo apt install etckeeper

- [ubuntu doc](https://ubuntu.com/server/docs/tools-etckeeper)
