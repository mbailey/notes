# firewalld


```shell
sudo firewall-cmd --set-log-denied=all
```

value may be one of: all, unicast, broadcast, multicast, or off


```shell
sudo journalctl -x -f | grep 'DROP\|REJECT' afterwards
```
