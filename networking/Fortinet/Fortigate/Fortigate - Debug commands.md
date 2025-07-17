# Fortigate - Enable/Disable debug

Stop all the prior debugs that were enabled and running in the foreground or background.

```
diagnose debug reset 
```

Start printing debugs in the console.

```
diagnose debug enable 
```

Stop printing debugs in the console. The debugs are still running in the background; use diagnose debug reset to completely stop them.
```
diagnose debug disable 
```

Start debugging for infinite duration. By default, debug is set for 30 minutes.

```
diagnose debug duration 0 
```


## Debugging DNS proxy

```
diagnose debug reset 
```

```
diagnose debug application dnsproxy -1
```

```
diagnose debug enable 
```

When finish:

```
diagnose debug disable 
```

```
diagnose debug reset 
```


## Restart DNS Proxy (If Necessary):

If you encounter persistent issues, restarting the DNS proxy might help. Use to restart the DNS proxy daemon. 

```
diagnose test application dnsproxy 99
```