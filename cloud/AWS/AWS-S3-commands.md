# AWS S3 cli commands:

## List objects in a bucket.
```bash
aws s3 ls s3://bucket-name 
```

## Upload a file.
```bash
aws s3 cp local-file.txt s3://bucket-name/

```

## Download a file.
```bash
aws s3 cp s3://bucket-name/file.txt ./

```

## Sync a local directory with an S3 bucket.
```bash
aws s3 sync local-folder s3://bucket-name/ 
```


## Create a new bucket.
```bash
aws s3 mb s3://new-bucket 
```


## Remove a bucket (must be empty).
```bash
aws s3 rb s3://bucket-name
```

