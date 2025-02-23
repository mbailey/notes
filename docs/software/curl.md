# curl


when client has stale CA Certs
```shell
wget https://curl.se/ca/cacert.pem
alias curl='curl --cacert "${HOME}/cacert.pem"'
```


```
curl --noproxy '*' # No proxy
```

## Specify IP

    curl https://DOMAIN.EXAMPLE --resolve 'DOMAIN.EXAMPLE:443:192.0.2.17'


## Option: `--write-out`

'%{http_code}       %{remote_ip}       %{remote_port}   %{response_code}'

| Value         | Description                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------ |
| http_code     | The numerical response code that was found in the last retrieved HTTP(S) or FTP(s) transfer.     |
| http_connect  | The numerical code that was found in the last response (from a proxy) to a curl CONNECT request. |
| http_version  | The http version that was effectively used. (Added in 7.50.0)                                    |
| remote_ip     | The remote IP address of the most recently done connection - can be either IPv4 or IPv6.         |
| remote_port   | The remote port number of the most recently done connection.                                     |
| response_code | The numerical response code that was found in the last transfer (formerly known as "http_code"). |

## Save output

Save to myfile.txt:

    curl http://www.example.com/data.txt -o myfile.txt

The #1 will get substituted with the url, so the filename contains the url:

    curl http://www.example.com/data.txt -o "file_#1.txt"

Save to data.txt, the filename extracted from the URL:

    curl http://www.example.com/data.txt -O

Saves to filename determined by the Content-Disposition header sent by the server:

    curl http://www.example.com/data.txt -O -J
