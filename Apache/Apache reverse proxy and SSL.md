```
Listen 443 https

SSLPassPhraseDialog exec:/usr/libexec/httpd-ssl-pass-dialog
SSLSessionCache         shmcb:/run/httpd/sslcache(512000)
SSLSessionCacheTimeout  300
SSLCryptoDevice builtin

<VirtualHost _default_:443>
# General setup for the virtual host, inherited from global configuration
DocumentRoot /var/www/html/rconfig7/current/public
ServerName rconfig7.emmirothusa.com
<Directory "/var/www/html/rconfig7/current/public">
        Options Indexes FollowSymLinks MultiViews
        Order allow,deny
        Allow from all
        AllowOverride All
        Require all granted
        Satisfy Any
</Directory>
# Use separate log files for the SSL virtual host; note that LogLevel
# is not inherited from httpd.conf.
ErrorLog logs/ssl_error_log
TransferLog logs/ssl_access_log
LogLevel warn
SSLEngine on
SSLHonorCipherOrder on
SSLCipherSuite PROFILE=SYSTEM
SSLProxyCipherSuite PROFILE=SYSTEM
SSLCertificateFile /etc/pki/tls/certs/emmirothusa_wildcard.crt
SSLCertificateKeyFile /etc/pki/tls/private/emmirothusa_wildcard.key

#SSLCertificateChainFile /etc/pki/tls/certs/server-chain.crt
#SSLCACertificateFile /etc/pki/tls/certs/ca-bundle.crt
#SSLVerifyClient require
#SSLVerifyDepth  10

<FilesMatch "\.(cgi|shtml|phtml|php)$">
    SSLOptions +StdEnvVars
</FilesMatch>
<Directory "/var/www/cgi-bin">
    SSLOptions +StdEnvVars
</Directory>

BrowserMatch "MSIE [2-5]" \
         nokeepalive ssl-unclean-shutdown \
         downgrade-1.0 force-response-1.0

CustomLog logs/ssl_request_log \
          "%t %h %{SSL_PROTOCOL}x %{SSL_CIPHER}x \"%r\" %b"
</VirtualHost>
```


```
<VirtualHost netbox.emmirothusa.com:443>
        ServerName netbox.emmirothusa.com
        ProxyRequests On

        SSLEngine on
        SSLHonorCipherOrder on
        SSLProxyEngine on

        SSLCipherSuite PROFILE=SYSTEM
        SSLProxyCipherSuite PROFILE=SYSTEM

        SSLCertificateFile /etc/pki/tls/certs/emmirothusa_wildcard.crt
        SSLCertificateKeyFile /etc/pki/tls/private/emmirothusa_wildcard.key

        ProxyPass / http://netbox.emmirothusa.com:8000/
        ProxyPassReverse / http://netbox.emmirothusa.com:8000/
        ProxyPreserveHost On
        RequestHeader set X-Forwarded-Proto "https"
        ProxyVia On
        ProxyRequests Off

</VirtualHost>
```


