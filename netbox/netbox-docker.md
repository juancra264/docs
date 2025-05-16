# Netbox Docker

Link with info about the project:
https://github.com/netbox-community/netbox-docker

## First Time Setup
```
git clone -b release https://github.com/netbox-community/netbox-docker.git
```
```
cd netbox-docker
```
```
tee docker-compose.override.yml <<EOF
services:
  netbox:
    ports:
      - 8000:8080
EOF
```
```
docker compose pull
```
```
docker compose up -d
```
Create admin for first time
```bash
docker compose exec netbox /opt/netbox/netbox/manage.py createsuperuser
```

---

## Netbox-docker operations

**DB BACKUP**
```bash
# Stop all containers
docker compose down

# Only start the DB
docker compose up -d postgres

# Take a DB backup
docker compose exec -T postgres sh -c 'pg_dump -cU $POSTGRES_USER $POSTGRES_DB' | gzip > db_dump.sql.gz

# Stop the database
docker compose down
```


**DB RESTORE**
```bash
# Stop all containers
docker compose down

# Restore the database
docker compose up -d postgres
gunzip -c db_dump.sql.gz | docker compose exec -T postgres sh -c 'psql -U $POSTGRES_USER $POSTGRES_DB'

# Start all other containers
docker compose up -d
```

**File Operations**

```bash
#Backup of the media directory, which contains uploaded images.
docker compose exec -T netbox tar c -jf - -C /opt/netbox/netbox/media ./ > media-backup.tar.bz2
```

```bash
# Restore of the media directory:
docker compose exec -T netbox tar x -jvf - -C /opt/netbox/netbox/media < media-backup.tar.bz2
```

