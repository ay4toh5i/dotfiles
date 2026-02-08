# Memo

## Search invalid symbolic link and delete

```sh
$ find .config -maxdepth 3 -type l ! -exec test -e {} \; -print
# ./path/to/file

$ find .config -maxdepth 3 -type l ! -exec test -e {} \; -delete
```


## kill gpg-agents and scdaemon

```sh
$ gpgconf --kill all
```
