How to login to FortiGate

```bash
curl -k -i -X POST https://x.x.x.x/logincheck -d "username=yyy&secretkey=zzz" --dump-header headers.txt -c cookies.txt/t code 
```

How to GET static route

```bash
curl -k -i -X GET https://x.x.x.x/api/v2/cmdb/router/static -b headers.txt
```

How to logout

```bash
curl -k -i -X POST https://x.x.x.x/logout
```