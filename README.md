# bof0: My First Buffer Overflow

To play with the bof0 application run:

```
docker run --rm --privileged -it ghcr.io/ethan42/bof0:vulnerable bash
...
ASLR has been disabled for this system. To re-enable it, run:
echo 2 | sudo tee /proc/sys/kernel/randomize_va_space
$
```

An example solution would lead to:

```
$ ./bof0 MAGIC_PAYLOAD_HERE
...
# whoami
root
```

Don't forget to turn on ASLR back after you are done!