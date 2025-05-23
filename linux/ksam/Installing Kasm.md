# Installing kasm server on Ubuntu linux

Download the latest version of Kasm Workspaces to /tmp:

```
cd /tmp
curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.17.0.bbc15c.tar.gz
```

Extract the package and run the installation script:

```
tar -xf kasm_release_1.17.0.bbc15c.tar.gz
```

```
sudo bash kasm_release/install.sh
```

For a single server installation, ensure that only access to the Web Application and port 3389 for RDP gateway access (if desired) is exposed. It is recommended to allocate 1 gigabyte of swap partition per concurrent session you expect to run at any given time for stability.

## Installing SSL certs with Let's Encrypt

After installation, you can set up SSL with Let's Encrypt by following these steps:

Turn off Kasm:
```
sudo systemctl stop kasm
```

Install Let's Encrypt and navigate to the Kasm SSL certificate directory:

```
apt -y install letsencrypt
```
```
cd /opt/kasm/current/certs
```

Create your SSL certificates:

```
certbot certonly --standalone --agree-tos --preferred-challenges http -d example.com
```

Replace example.com with your domain name that points to your server.

Backup your self-signed certificates:

```
mv kasm_nginx.crt kasm_nginx.crt.bk
mv kasm_nginx.key kasm_nginx.key.bk
```

Set up symlinks for the Let's Encrypt certificates:

```
ln -s /etc/letsencrypt/live/example.com/fullchain.pem kasm_nginx.crt
```
```
ln -s /etc/letsencrypt/live/example.com/privkey.pem kasm_nginx.key
```

Start Kasm back up:
```
sudo systemctl start kasm
```

Once you've completed these steps, your Kasm Workspaces instance should be accessible with SSL.