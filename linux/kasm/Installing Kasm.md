# Installing kasm server on Ubuntu linux

Download the latest version of Kasm Workspaces to /tmp:

```shell
cd /tmp
curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.17.0.bbc15c.tar.gz
```

Extract the package and run the installation script:

```shell
tar -xf kasm_release_1.17.0.bbc15c.tar.gz
```

```shell
sudo bash kasm_release/install.sh
```

For a single server installation, ensure that only access to the Web Application and port 3389 for RDP gateway access (if desired) is exposed. It is recommended to allocate 1 gigabyte of swap partition per concurrent session you expect to run at any given time for stability.

## Installing SSL certs with Let's Encrypt

After installation, you can set up SSL with Let's Encrypt by following these steps:

Turn off Kasm:
```shell
sudo /opt/kasm/bin/stop
```

Install Let's Encrypt and navigate to the Kasm SSL certificate directory:

```shell
sudo apt -y install letsencrypt
```

```shell
cd /opt/kasm/current/certs
```

Create your SSL certificates:

```shell
certbot certonly --standalone --agree-tos --preferred-challenges dns -d example.com
```

Replace example.com with your domain name that points to your server.

Backup your self-signed certificates:

```shell
sudo mv kasm_nginx.crt kasm_nginx.crt.bk
sudo mv kasm_nginx.key kasm_nginx.key.bk
```

Set up symlinks for the Let's Encrypt certificates:

```shell
sudo ln -s /etc/letsencrypt/live/example.com/fullchain.pem kasm_nginx.crt
```
```shell
sudo ln -s /etc/letsencrypt/live/example.com/privkey.pem kasm_nginx.key
```

Change the ownership:

```shell
sudo chown kasm:kasm kasm_nginx.crt
````

```shell
sudo chown kasm:kasm kasm_nginx.key
```

Start Kasm back up:
```shell
sudo /opt/kasm/bin/start
```

Test if nginx is running correctly. Wait 30 seconds.

```shell
sudo docker ps | grep kasm_proxy
```

Once you've completed these steps, your Kasm Workspaces instance should be accessible with SSL.