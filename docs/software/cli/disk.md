# disk

## identification

### Spinning platters or SSD

    $ cat /sys/block/sda/queue/rotational
    1
    $ cat /sys/block/nvme1n1/queue/rotational
    0

    $ lsblk -d -o name,rota
    NAME    ROTA
    sda        1
    sr0        1
    nvme0n1    0
    nvme1n1    0
    nvme2n1    0
    nvme3n1    0
    nvme4n1    0
    nvme5n1    0
    nvme6n1    0
    nvme7n1    0


## Performance

### Gnome Disks

Quick an easy way to test performance.

- Note: it unmounts disk before check - won't work on root disk

![](../../assets/Pasted%20image%2020230104115435.png)

### hdparm

Install:

    sudo yum -y install hdparm

Check disk speed:

    [m@x2 ~]$ sudo hdparm -tT /dev/dm-1

    /dev/dm-1:
     Timing cached reads:   30464 MB in  2.00 seconds = 15258.62 MB/sec
     Timing buffered disk reads:  62 MB in  4.26 seconds =  14.54 MB/sec



### fio

- [Welcome to FIO’s documentation! — fio 3.32-43-g0ebd3-dirty documentation (fio.readthedocs.io)](https://fio.readthedocs.io/en/latest/index.html)
- [How fast are your disks Find out the open source way, with fio  Ars Technica (arstechnica.com)](https://arstechnica.com/gadgets/2020/02/how-fast-are-your-disks-find-out-the-open-source-way-with-fio/)

https://arstechnica.com/gadgets/2020/02/how-fast-are-your-disks-find-out-the-open-source-way-with-fio/

#### Single 4KiB random write process

    fio --name=random-write --ioengine=posixaio --rw=randwrite \
      --bs=4k --size=4g --numjobs=1 --iodepth=1 --runtime=60 \
      --time_based --end_fsync=1

mtnug-fio-4gx1.txt:          WRITE: bw=170MiB/s (178MB/s)
mtnug-vm-volt-fio-4gx1.txt:  WRITE: bw=63.5MiB/s (66.6MB/s)

    # 16 parallel 64KiB random write processes
    fio --name=random-write --ioengine=posixaio --rw=randwrite    \
      --bs=64k --size=256m --numjobs=16 --iodepth=16 --runtime=60 \
      --time_based --end_fsync=1

mtnug-fio-64k256m1616.txt:          WRITE: bw=3365MiB/s (3528MB/s)
mtnug-vm-volt-fio-64k256m1616.txt:  WRITE: bw=1870MiB/s (1961MB/s)

    # Single 1MiB random write process
    fio --name=random-write --ioengine=posixaio --rw=randwrite \
      --bs=1m --size=16g --numjobs=1 --iodepth=1 --runtime=60  \
      --time_based --end_fsync=1

mtnug-fio-1m16g11.txt:          WRITE: bw=681MiB/s (714MB/s)
mtnug-vm-volt-fio-1m16g11.txt:  WRITE: bw=663MiB/s (696MB/s)


### dd

<!-- markdown-link-check-disable-next-line -->
https://www.cyberciti.biz/faq/howto-linux-unix-test-disk-performance-with-dd-command/

Use the dd command to measure server throughput (write speed):

    dd if=/dev/zero of=test1.img bs=1G count=1 oflag=dsync

Use the dd command to measure server latency:

    dd if=/dev/zero of=test2.img bs=512 count=1000 oflag=dsync

[root@ojnsdsrv01 data]# dd if=/dev/zero of=/data/test1.img bs=1G count=1 oflag=dsync
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB) copied, 4.1452 s, 259 MB/s


[fio](https://support.binarylane.com.au/support/solutions/articles/1000055889-how-to-benchmark-disk-i-o)

measuring disk performance
