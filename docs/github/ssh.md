# GitHub SSH

- GitHub accepts Git connections via SSH and HTTPS.
- SSH keys are used to identify which GitHub user is connecting.
    - [Multi-account Git SSH access](#multi-account-git-ssh-access) requires special setup.

## Multi-account Git SSH Access

```txt
# ~/.ssh/config

Host github-mbailey
  User git
  HostName github.com
  IdentityFile ~/.ssh/id-github-mbailey
  IdentitiesOnly yes

Host github-work-account
  User git
  HostName github.com
  IdentityFile ~/.ssh/id-github-work
  IdentitiesOnly yes
```

## Troubleshooting

### Which account is this SSH public key used for?

The simplest and quickest way to verify which GitHub account a key is setup on is to use it to connect:

```shell
$ ssh -i ~/.ssh/id-github-mbailey git@github.com
Enter passphrase for key 'id-github-mbailey': 
PTY allocation request failed on channel 0
Hi mbailey! You've successfully authenticated, but GitHub does not provide shell access.
Connection to github.com closed.
```


### Reviewing your SSH keys

- [Reviewing your SSH keys - GitHub Docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/reviewing-your-ssh-keys)
- https://github.com/settings/keys

You can review [your SSH keys on GitHub](https://github.com/settings/keys) and compare the public key fingerprints against those of your local keys. 

Start ssh-agent:
```shell
$ eval "$(ssh-agent -s)"
> Agent pid 59566
```

Load GitHub keys into ssh-agent:
```shell
$ ssh-add $(ls ~/.ssh/id-github* | grep -v '.pub')
Enter passphrase for /home/m/.ssh/id-github-mbailey: 
Identity added: /home/m/.ssh/id-github-mbailey (mike@home)
Identity added: /home/m/.ssh/id-github-work (mike@work)
```

List public key fingerprints:
```shell
$ ssh-add -l -E sha256
256 SHA256:i89Xb33AS/iF/ThIS/wAS/ReALdgcZWAtKpR6dn7gzAw mike@home (ED25519)
256 SHA256:VEF2ei503nwBIqIRCOGGtAbsR5SOcFAKEYuGxMndABng mike@work (ED25519)
```
