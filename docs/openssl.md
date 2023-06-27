# openssl


View details of a pem file

    openssl x509 -in stunnel.pem -text -noout


Connect to webserver and show cert:

```
$ openssl s_client -servername example.com  -connect example.com:443 2>/dev/null | openssl x509 -noout -dates
notBefore=Jun  6 00:00:00 2023 GMT
notAfter=Jun  5 23:59:59 2024 GMT
```
