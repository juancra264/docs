# Gitlab Restore Commands

Using Docker container deployment:

```bash
# Stop Services:
docker exec -it gitlab gitlab-ctl stop puma
docker exec -it gitlab gitlab-ctl stop sidekiq

# Verify Status
#docker exec -it gitlab gitlab-ctl status

# Run the restore (omit the _gitlab_backup.tar suffix from the backup name):
docker exec -it gitlab restore BACKUP=11493107454_2018_04_25_10.6.4-ce
docker exec -it gitlab gitlab-backup restore BACKUP=/var/opt/gitlab/1775746723_2026_04_09_18.10.3

# Restart and verify:
docker restart gitlab
#
docker exec -it gitlab gitlab-rake gitlab:check SANITIZE=true
```