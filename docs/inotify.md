# inotify

- [inotify-consumers · fatso83/dotfiles](https://github.com/fatso83/dotfiles/blob/master/utils/scripts/inotify-consumers)
    - generates reports on who's using watchers

## inotify watcher count limit

Check current limits:

```shell
$ sysctl fs.inotify
fs.inotify.max_queued_events = 16384
fs.inotify.max_user_instances = 128
fs.inotify.max_user_watches = 409600
```

Count opened files:

```shell
lsof | grep inotify | wc -l
```

Maybe increase the limit:

```shell
echo "fs.inotify.max_user_watches=409600" | sudo tee -a /etc/sysctl.conf
echo "fs.inotify.max_user_watches=204800" | sudo tee -a /etc/sysctl.conf
```

Check who's using them all:

```shell
$ bin/inotify-consumers 

   INOTIFY   INSTANCES
   WATCHES      PER   
    COUNT     PROCESS   PID USER         COMMAND
------------------------------------------------------------
   26730         1        2815 m           /usr/bin/syncthing serve --no-browser --logfile=default
    5374         1        3900 m           /usr/libexec/tracker-miner-fs-3
<snip>
   35051  WATCHES TOTAL COUNT

INotify instances per user (e.g. limits specified by fs.inotify.max_user_instances): 

INSTANCES    USER
-----------  ------------------
65           m
```

/proc interfaces

```txt
     The following interfaces can be used to limit the amount of
     kernel memory consumed by inotify:

     /proc/sys/fs/inotify/max_queued_events
            The value in this file is used when an application calls
            inotify_init(2) to set an upper limit on the number of
            events that can be queued to the corresponding inotify
            instance.  Events in excess of this limit are dropped, but
            an IN_Q_OVERFLOW event is always generated.

     /proc/sys/fs/inotify/max_user_instances
            This specifies an upper limit on the number of inotify
            instances that can be created per real user ID.

     /proc/sys/fs/inotify/max_user_watches
            This specifies an upper limit on the number of watches
            that can be created per real user ID.
```
