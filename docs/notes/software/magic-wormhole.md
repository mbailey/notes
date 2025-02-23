# magic-wormhole

 - [magic-wormhole - get things from one computer to another, safely](https://github.com/magic-wormhole/magic-wormhole#magic-wormhole)

Command line tool to send files to anyone.

- Deliciously simple UI
- I've not investigated in depth yet

## Ideas

- Use `.wormhole/` directory in projects to receive contributions from other machines for that dir. Globally Git Ignore .wormhole

## Self Hosted

- [Magic Wormhole Mailbox Server (github.com)](https://github.com/magic-wormhole/magic-wormhole-mailbox-server):  Main server [Magic-Wormhole](http://magic-wormhole.io/) clients connect to.
- [Magic Wormhole Transit Relay (github.com)](https://github.com/magic-wormhole/magic-wormhole-transit-relay):  Helps clients behind NAT establish bulk-data transit connections.

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

## See also

- [GitHub - Jacalzrymdport Cross-platform application for easy encrypted file, folder, and text sharing between devices. (github.com)](https://github.com/Jacalz/rymdport)
