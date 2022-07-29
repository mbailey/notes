# date

## From epoch

    $ date -d @1361234760
    Tue Feb 19 11:46:00 2013

## Replace all epoch timestamps in a file with Human Readable

    $ echo foo,1361234760,bar | perl -pe 's/(\d+)/localtime($1)/e'
    foo,Tue Feb 19 11:46:00 2013,bar


