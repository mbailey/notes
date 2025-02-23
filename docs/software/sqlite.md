# sqlite

## Connect

    sqlite3 example.db

## Import a csv

```
sqlite> .mode csv
sqlite> .separator \t
sqlite> .import FILENAME TABLENAME
```


## Describe things

    .tables

    .schema table_name


## What process has locked that file?

    fuser superset.db
    kill -9 5430


## Unlock DB

    echo ".dump" | sqlite superset.db | sqlite superset.db-new
