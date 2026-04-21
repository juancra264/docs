# Gitlab Runner Config Files

## Config

./config/config.toml

```toml
concurrent = 10
log_level = "warning"
log_format = "json"
check_interval = 5

[[runners]]
  name = "gitlab-runner-1"
  url = "https://gitlab.emmirothusa.com/"
  executor = "docker"
  token = "{{token_gitlab_server}}"
  limit = 0
  # Execute script to install the certificate before every job
  #pre_build_script = """
  #apk add ca-certificates > /dev/null
  #cp /etc/gitlab-runner/certs/ca.crt /usr/local/share/ca-certificates/ca.crt
  #update-ca-certificates --fresh > /dev/null
  #"""
  # FIXME To increase rate limits, when pulling down images from the Docker Hub you might want to authenticate:
  # 1. Create a Docker Hub account and generate a personal access token
  # 2. Encode the username and token in base64
  #    Example: echo -n 'username:token' | base64
  # 3. Replace the <BASE64_ENCODED_AUTH> with the base64 encoded string
  environment = ["DOCKER_AUTH_CONFIG={\"auths\":{\"https://index.docker.io/v1/\":{\"auth\":\"<BASE64_ENCODED_AUTH>\"}}}"]
  [runners.docker]
    tls_verify = false
    image = "docker:latest"
    privileged = true
    disable_cache = false
    volumes = ["/var/run/docker.sock:/var/run/docker.sock", "/cache"]
  [runners.cache]
    Insecure = false

```

## Docker-compose

```yaml
---
services:
  gitlab-runner:
    container_name: gitlab-runner-1
    image: docker.io/gitlab/gitlab-runner:alpine-v18.10.1
    volumes:
      - ./config/config.toml:/etc/gitlab-runner/config.toml:ro
      - ./certs/ca.crt:/usr/local/share/ca-certificates/godaddy.crt:ro
      - /var/run/docker.sock:/var/run/docker.sock
    entrypoint: >
      sh -c "update-ca-certificates && /usr/bin/dumb-init /entrypoint run"
    networks:
      - proxy
    restart: unless-stopped
networks:
  proxy:
    external: true

```
