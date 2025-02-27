---
author: mbailey
comments: false
date: 2008-05-06 04:27:35+00:00

slug: getting-monit-to-restart-mongrel-after-a-crash
title: Getting monit to restart mongrel after a crash
wordpress_id: 22
categories:
- deployment
- ruby on rails
---

An annoying aspect of the [Mongrel](http://mongrel.rubyforge.org/) webserver is
that it refuses to start if it detects a stale pidfile. This causes real
problems when you're trying to use something like
[Monit](http://www.tildeslash.com/monit/) to automatically restart mongrel
after a crash.

Most daemons check whether the process_id in the pidfile is running. Ezra has
indicated that a future release of mongrel will do this but in the meantime, we
can use [mongrel_cluster](http://mongrel.rubyforge.org/wiki/MongrelCluster)
with the --clean option to remove stale pidfiles before starting mongrel.

Update /etc/init.d/mongrel_cluster to include the --clean option in the start and restart commands.

```bash
  start)
    # Create pid directory
    mkdir -p $PID_DIR
    # chown $USER:$USER $PID_DIR

    mongrel_cluster_ctl start --clean -c $CONF_DIR
    RETVAL=$?
;;
  stop)
    mongrel_cluster_ctl stop -c $CONF_DIR
    RETVAL=$?
;;
  restart)
    mongrel_cluster_ctl restart --clean -c $CONF_DIR
    RETVAL=$?
```

Update your monit config to use mongrel_cluster. Note that monit sets a
restricted path (PATH=/bin:/usr/bin:/sbin:/usr/sbin) and the internals of  the
mongrel_cluster gem call mongrel_rails without specifying the path. mongrel
maintainers [http://mongrel.rubyforge.org/ticket/31#comment:1 suggest] using
env in the monit command and said this is already fixed in a svn. I've found
creating a symlink from /usr/local/bin/mongrel_rails to /usr/bin/mongrel_rails
does the trick.  Then update your monit config to look something like this:

```
check process mongrel-8010 with pidfile /var/www/apps/tubemarks/shared/pids/mongrel.8010.pid
group mongrel
start program = "/usr/local/bin/ruby /usr/local/bin/mongrel_rails cluster::start --only 8010 -C /etc/mongrel_cluster/tubemarks.yml"
start program = "/usr/local/bin/ruby /usr/local/bin/mongrel_rails cluster::stop --only 8010 -C /etc/mongrel_cluster/tubemarks.yml"
```

The nice part here is the --only option which allows you to restrict the command to a single mongrel process (as defined in the config file).

I've deprec-1.99.16 has been updated to use mongrel_cluster as described above
to clean up stale pidfiles before starting mongrel. As a side note, I was glad
to see mongrel has a new [website](http://mongrel.rubyforge.org/) and is being
fed and cared for by it's new owners.
