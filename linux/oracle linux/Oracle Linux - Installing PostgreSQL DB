
External Postgre DB installing:

sudo dnf install postgresql
psql -V
sudo -u postgres psql


sudo dnf install postgresql16-server

```
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo dnf install -y postgresql16-server postgresql16
psql -V
```


sudo /usr/pgsql-16/bin/postgresql-16-setup initdb

sudo vi /var/lib/pgsql/16/data/postgresql.conf
 Update the listen_addresses parameter to allow connections from all hosts on your local network.
       listen_addresses = '*'

Add the IP range for the container bridge:

sudo vim /var/lib/pgsql/16/data/pg_hba.conf
host    all             all             172.18.0.0/16            scram-sha-256


sudo systemctl restart postgresql-16
sudo systemctl enable postgresql-16

sudo passwd postgres           
sudo -i -u postgres
psql

```

CREATE DATABASE netbox;
CREATE USER netbox WITH PASSWORD 'SetaSecurePassword!!!!!!';
ALTER DATABASE netbox OWNER TO netbox;
GRANT CREATE ON SCHEMA public TO netbox;
\q
```

```
psql --username netbox --password --host localhost netbox
```

Type \conninfo to confirm your connection, or type \q to exit.

**Removing Installation:**

```
sudo systemctl stop postgresql-16
sudo dnf remove -y postgresql16-server postgresql16
sudo rm -rf /var/lib/pgsql/
userdel postgres
sudo dnf remove -y pgdg-redhat-repo-latest.noarch.rpm
```
