# Setup etckeeper

Keep /etc in Git.

```shell
 sudo dnf -y install etckeeper

 git config --global user.email || git config --global user.email "you@example.com"
 git config --global user.name || git config --global user.name "Your Name"

 etckeeper init
 etckeeper vcs status
 etckeeper vcs commit -m 'msg'
 ```