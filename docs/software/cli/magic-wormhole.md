# magic-wormhole

 - [magic-wormhole - get things from one computer to another, safely](https://github.com/magic-wormhole/magic-wormhole#magic-wormhole)

Command line tool to send files to anyone.

- Deliciously simple UI
- I've not investigated in depth yet

## Quickstart (fedora-36)

    $ sudo dnf install magic-wormhole
    <snip >
    $ echo wormhole > wormhole.text
    $ wormhole send wormhole.text
    Sending 9 Bytes file named 'wormhole.text'
    Wormhole code is: 9-handiwork-upset
    On the other computer, please run:

    wormhole receive 9-handiwork-upset

## macos

    brew install magic-wormhole
