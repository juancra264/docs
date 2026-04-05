# Restic with Amazon S3

## Create an Amazon S3 

```bash
aws s3api create-bucket \
    --bucket back-up-restic \
    --region us-east-1 \
    --create-bucket-configuration LocationConstraint=us-east-1
```

Confirm the S3 bucket created:

```bash
https://s3.console.aws.amazon.com/s3/buckets?region=us-east-1
```

## Create IAM policy

```json
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:PutObject",
          "s3:ListBucket",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::back-up-restic",
          "arn:aws:s3:::back-up-restic/*"
        ]
      }
    ]
  }
```

## Create IAM user

```bash
aws iam create-user --user-name restic-user
```

```bash
aws iam put-user-policy \
--user-name restic-user \
--policy-name restic-policy \ 
--policy-document file://restic-policy.json
```

```bash
aws iam create-access-key --user-name restic-user
```

## Installing Restic

On a Mac:
```bash
brew install restic
```

On Debian/Ubuntu:
```bash
apt-get install restic
```

On Arch Linux:

```bash
pacman -S restic --noconfirm
```

On Fedora:

```bash
dnf install restic
```

You now have Restic installed on your machine. You can verify the installation with:

```bash
restic version
```

## Setting Restic Configuration

### Create the .restic.env

```bash
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export RESTIC_PASSWORD=""
export RESTIC_REPOSITORY="s3:s3.es-east-1.amazonaws.com/back-up-restic"
```

```bash
chmod 400 ~/.restic.env
```

```bash
source ~/.restic.env
```

Verify the configuration:

```bash
echo $RESTIC_REPOSITORY
```

### Initializing Your Repository

```bash
restic init
```

### Verify the repository

```bash
restic check
```

### Backing Up Data to S3 Bucket

```bash
restic backup /etc
```

### Verify the snapshot 

```bash
restic snapshots
```

## Verify Restic Stats

```bash
restic stats
```

### Restoring Data From S3 Bucket

```bash
restic snapshots
```

```bash 
restic restore 76a6c637 --target ~/backup-file
```

## Schedule Backups

```bash
crontab -e
```

This command does the following every hour:

```bash
# m h   dom mon dow command
0   *   *   *   *   . ~/.restic.env && restic backup /etc/nginx ~/sample-site.com/ 2>> ~/restic.error.log >> ~/restic.log
```

This will keep the last 10 backups, one backup per day for the last 30 days, and one backup per month for the last 12 months.

```bash
# m h   dom mon dow command
1   0   *   *   *   . ~/.restic.env && restic forget --keep-last 10 --keep-daily 30 --keep-monthly 12 2>> ~/restic.error.log >> ~/restic.log
```