# Mosh commands

Connecting to mosh server:

```
mosh username@remote_host
```

Connect to a Remote Server with a Specific Identity (Private Key)

```
mosh --ssh="ssh -i path/to/key_file" username@remote_host
```

Connect to a Remote Server Using a Specific Port

```
mosh --ssh="ssh -p 2222" username@remote_host

```

Run a Command on a Remote Server

```
mosh remote_host -- command -with -flags
```

