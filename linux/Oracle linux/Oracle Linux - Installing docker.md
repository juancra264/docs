```
sudo dnf update -y
```

```
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
```

```
sudo dnf install docker-ce -y
```

```
sudo usermod -aG docker juanramirez
```

```
sudo systemctl start docker
sudo systemctl enable docker
```

```
systemctl status docker
docker info
```

