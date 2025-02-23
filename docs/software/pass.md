# unix pass

Unix password store. CLI tool with GPG & Git support.2

| Action                    | Command                         |
| ------------------------- | ------------------------------- |
| Add a password            | `pass insert [name]`            |
| Copy to clipboard         | `pass -c [name]`                |
| Change gpg key            | `pass init [KEYID]`             |
| Generate a new password   | `pass generate [name] [length]` |
| Edit an existing password | `pass edit [name]`              |
| Remove a password         | `pass rm [name]`                |
| Show password store tree  | `pass`                          |
| Search for passwords      | `pass find [search-term]`       |

**Find a password:**
```shell
m@x2 ~$ pass find hackmd
Search Terms: hackmd
└── personal
    └── services
        └── hackmd.io
```
