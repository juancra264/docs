# Gitlab server Config Files

./config/gitlab.rb

```ruby
# External URL
external_url 'https://{{URL_Gitlab}}'

# SSH port
gitlab_rails['gitlab_shell_ssh_port'] = {{SSH_REPO_PORT}}

# Letsencrypt disable for self-signed certs or using a reverse proxy with TLS termination
letsencrypt['enable'] = false

# Nginx for web access
nginx['listen_port'] = 80
nginx['listen_https'] = false

# Auth with OpenID Connect (e.g. Authentik, Keycloak, etc.)
#gitlab_rails['omniauth_auto_link_user'] = ['openid_connect']
#gitlab_rails['omniauth_providers'] = [
#  {
#    name: "openid_connect", # do not change this parameter
#    label: "Authentik", # optional label for login button, defaults to "Openid Connect"
#    icon: "https://avatars.githubusercontent.com/u/82976448?s=200&v=4",
#    args: {
#      name: "openid_connect",
#      scope: ["openid","profile","email"],
#      response_type: "code",
#      issuer: "https://authentik-prod-1.kube-prod-1.home.clcreative.de/application/o/gitlab-prod-1/",
#      discovery: true,
#      client_auth_method: "query",
#      uid_field: "email",
#      send_scope_to_token_endpoint: "false",
#      pkce: true,
#      client_options: {
#        identifier: "*****",
#        secret: "*****",
#        redirect_uri: "https://gitlab-prod-1.srv-prod-1.home.clcreative.de/users/auth/openid_connect/callback"
#      }
#    }
#  }
#]

# Email
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.sendgrid.net"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "{{SMTP_USER_NAME}}"
gitlab_rails['smtp_password'] = "{{SMTP_PASSWORD}}"
gitlab_rails['smtp_domain'] = "smtp.sendgrid.net"
gitlab_rails['smtp_authentication'] = "plain"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
# If use Single Sender Verification You must configure from. If not fail
# 550 The from address does not match a verified Sender Identity. Mail cannot be sent until this error is resolved.
# Visit https://sendgrid.com/docs/for-developers/sending-email/sender-identity/ to see the Sender Identity requirements
gitlab_rails['gitlab_email_from'] = 'gitlab@{{domain}}'
gitlab_rails['gitlab_email_reply_to'] = 'noreply@{{domain}}'

# Performance tweaks
# Performance optimizations for homelab/low-resource environments
# NOTE: These settings reduce resource usage but may impact performance under high load
postgresql['shared_buffers'] = "256MB"
sidekiq['max_concurrency'] = 4
sidekiq['concurrency'] = 1
puma['worker_timeout'] = 120
puma['worker_processes'] = 1

# Prometheus monitoring
prometheus_monitoring['enable'] = false

# backup to AWS S3
gitlab_rails['backup_upload_connection'] = {
  'provider' => 'AWS',
  'region' => '{{AWS_REGION}}',
  # Choose one authentication method
  # IAM Profile
  'use_iam_profile' => true,
  # OR AWS Access and Secret key
  'aws_access_key_id' => '{{AWS_ACCESS_KEY_ID}}',
  'aws_secret_access_key' => '{{AWS_SECRET_ACCESS_KEY}}'
}
gitlab_rails['backup_upload_remote_directory'] = '{{S3_BUCKET_NAME}}'
gitlab_rails['backup_multipart_chunk_size'] = 104857600
gitlab_rails['backup_upload_storage_options'] = {
  'server_side_encryption' => 'AES256'
}

# LDAP Configuration:
gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = {
  'main' => {
    'label' => 'LDAP',
    'host' => 'ldap.{{domain}}',
    'port' => 636,
    'uid' => 'sAMAccountName',
    'bind_dn' => 'CN=LDAPUsrSrch,CN=Users,DC={{domainwithoutdot}},DC=com',
    'password' => '{{LDAP_PASSWORD}}',
    'encryption' => 'simple_tls',
    'verify_certificates' => true,
    'timeout' => 10,
    'active_directory' => true,
    'base' => 'DC={{domainwithoutdot}},DC=com',
    'allow_username_or_email_login' => false,
    'block_auto_created_users' => false,
    'user_filter' => '(memberOf=CN={{groupname}},OU=Login Rights,OU=Security Groups,OU=Corporate,DC={{domain}},DC=com)'
  }
}
```

## Docker compose file

```yaml
---
services:
  gitlab:
    container_name: gitlab
    image: gitlab/gitlab-ce:18.10.3-ce.0
    ports:
      - '2222:22'
    volumes:
      - ./config:/etc/gitlab
      - ./logs:/var/log/gitlab
      - ./data:/var/opt/gitlab
    shm_size: '256m'
    networks:
      - proxy
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.gitlab.entrypoints=web, websecure"
      - "traefik.http.routers.gitlab.rule=Host(`gitlab.domain.com`)"
      - "traefik.http.routers.gitlab.tls=true"
      - "traefik.http.routers.gitlab.service=gitlab"
      - "traefik.http.services.gitlab.loadbalancer.server.port=80"
      - "traefik.docker.network=proxy"
    restart: unless-stopped
networks:
  proxy:
    external: true

```

