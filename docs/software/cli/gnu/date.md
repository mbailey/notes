# date

```
timestamp=$(date +%Y%m%dT%H%M%S%z)
```

## Convert various formats to ISO-8601


$ echo "Sep 24 03:30:00 2023" | xargs -I {} date -d "{}" --iso-8601=seconds
2023-09-24T03:30:00+10:00

## From epoch

    $ date -d @1361234760
    Tue Feb 19 11:46:00 2013

## Replace all epoch timestamps in a file with Human Readable

    $ echo foo,1361234760,bar | perl -pe 's/(\d+)/localtime($1)/e'
    foo,Tue Feb 19 11:46:00 2013,bar


