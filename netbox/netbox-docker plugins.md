# Netbox-Docker pluggins Installation WITHOUT updating Netbox Image to Latest

**_NOTE:_** For Docker install to latest please see: [Docker install](https://github.com/netbox-community/netbox-docker/wiki/Using-Netbox-Plugins)

Go the directory, where Netbox Docker exists

```
cd netbox-docker/
```

create or amend plugin_requirements.txt and Dockerfile-Plugins:

```
touch plugin_requirements.txt
touch Dockerfile-Plugins
```

```
echo netbox_topology_views >> plugin_requirements.txt
```

Dockerfile-Plugins

```
FROM netboxcommunity/netbox:v4.1.11

COPY ./plugin_requirements.txt /opt/netbox/
RUN /usr/local/bin/uv pip install -r /opt/netbox/plugin_requirements.txt

# To create the image folder.
RUN mkdir -p /opt/netbox/netbox/static/netbox_topology_views/img

# These lines are only required if your plugin has its own static files.
COPY configuration/configuration.py /etc/netbox/config/configuration.py
COPY configuration/plugins.py /etc/netbox/config/plugins.py
RUN DEBUG="true" SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
```

docker-compose.override.yml

```
services:
  netbox:
    image: netbox:v4.1.11-plugins
    pull_policy: never
    ports:
      - 8000:8080
    build:
      context: .
      dockerfile: Dockerfile-Plugins
  netbox-worker:
    image: netbox:v4.1.11-plugins
    pull_policy: never
  netbox-housekeeping:
    image: netbox:v4.1.11-plugins
    pull_policy: never
```

configuration/plugins.py

```
PLUGINS = ["netbox_topology_views"]

PLUGINS_CONFIG = {
    'netbox_topology_views': {
        'static_image_directory': 'netbox_topology_views/img',
        'allow_coordinates_saving': True,
        'always_save_coordinates': True
    }
}
```

Build and Deploy!
```
docker compose build --no-cache
docker compose up -d
```

Use this command if you need to migrate your database
```
docker-compose exec netbox python3 manage.py migrate
docker-compose exec netbox python3 manage.py migrate netbox_topology_views
```