# GnuPG

[GNU Privacy Guard](https://gnupg.org/)

List the keys a file is encrypted for:

    $ gpg example.gpg
    gpg: WARNING: no command supplied.  Trying to guess what you mean ...
    gpg: encrypted with rsa2048 key, ID FFFFFFFFFFFFFFF1, created 2011-01-11
          "Mike 1 <mike@example1.com>"
    gpg: encrypted with rsa2048 key, ID FFFFFFFFFFFFFFF2, created 2011-01-11
          "Mike 2 <mike2@example.com>"
    gpg: encrypted with rsa4096 key, ID FFFFFFFFFFFFFFF3, created 2011-01-11
          "Mike 3 <mike3@example.com>"


Edit trust on a key:

    $ gpg --edit-key 0x1234567812345678

Import a key from github:

    wget https://github.com/mbailey.gpg
    gpg --import ./mbailey.gpg
