# Managing Cross Org Github SSH Boundaries

SSH keys in a GitHub account are long lived and work across all Organizations that:

- permit SSH access to repos
- have authorized the key for access if the Organization enforces SSO (Single sign-on)
- have granted the user access to repos

This means that anyone obtaining access to an SSH key for your Github account may possibly be able to access repos for more than one Org.

Using an SSH key on a client managed device could grant access to other clients repos.
### Suggested Mitigations

1. **Separate GitHub user for each Org**: Reduces blast radius from compromise. 100% mitigation.
3. **Different SSH keys (same user) for each Org**: This will only protect Orgs that require SSO.
2. **Store SSH keys on hardware token**: Use a yubikey (or similar) for your SSH credentials. 
4. **Org prohibits SSH Access**: Orgs cannot control how users manage their SSH keys
