# Private Kitchen Consulting

Maintaining privacy boundaries when working on a client managed devices.

![Not a private kitchen](../assets/tokyo-tepanyaki.png)

## Overview

When working on a device managed by a client, I try to ensure the device is not trusted with any intellectual property that is not either:

- public domain
- proprietary but owned by or shared with the client

Examples of things I think should not be shared with the client:

1. **Digital Identities**: Personal digital certificates, SSH keys, or other digital authentication methods.
2. **Proprietary Tools or Utilities**: Any custom-built software or tools developed internally that are not licensed for external use.
3. **Tool Configurations**: Configuration files for software tools, especially those that might contain sensitive defaults or comments.
4. **Non-Public Research and Development Information**: Information about research, experiments, or developments that are not public knowledge.
5. **Internal Communication**: Emails, chat histories, or meeting notes related to your company or other clients.
6. **Confidential Documents**: This includes any documents related to other clients or projects that are not directly related to the current client.
7. **Personal or Company Policies and Handbooks**: Internal policies, handbooks, or procedures that are not meant for external audiences.
8. **Client-Specific Information**: Any information or data pertaining to other clients, even if it seems inconsequential.
9. **Personal Data**: Avoid storing any personal data, including contact information, personal emails, and private documents.

By ensuring these types of intellectual property are not stored or accessed on a client's managed device, I can better protect the privacy and integrity of intellectual assets belonging to me, my employer and the clients I serve.


## Digital Identities

Assume someone else has complete control of your client devices and can view keystrokes, etc (even if they don't now).

1. Avoid using credentials that authorise access to things the client should not access on client managed device.
2. Do not enter non-client managed long lived credentials (e.g. passwords) on the client device.
3. Use hardware tokens (e.g. yubikeys) to store credentials ( e.g. FIDO / SSH / GPG keys) as these cannot be copied from the device and require touch activation.
4. Use short lived tokens on your device (e.g. OpenID Connect Device Flow) where authentication is performed on a trusted device.

## Notes

I want to access parts of my "Second Brain" from the client device but not all.

My personal knowledgebase has the following top level structure:

```shell
notes
- personal
- public
- work
  - clients
    - clientA
    - clientB
```

It benefits me (and possibly others) to keep anything that is not confidential under `public/`

They're separate Git repos. I can checkout my public and specific client notes to each client while keeping them all in one [Obsidian](https://obsidian.md/) vault. 

You can find my public notes here: 

- **Git**: https://github.com/mbailey/notes
- **Web**: https://mike.bailey.net.au/notes/

If my SSH key is on my yubikey, I can trust that the client device is not committing to my client notes without my knowledge.

## Private Kitchen Pattern

**Private Kitchen**: My trusted devices  
**Front of House**: Client managed devices  

Despite the revelations in Anthony Bourdain's book "[Kitchen Confidential: Adventures in the Culinary Underbelly](https://en.wikipedia.org/wiki/Kitchen_Confidential_(book))", it's a common pattern for restaurants to prepare food in a private kitchen you cannot see or enter. Exceptions to this pattern are notable and often a novelty.

When preparing a product for a client, I default to the "private kitchen" pattern and present the deliverables to the client as a waiter does for a meal.

There are many reasons for this but the primary one is to  it enables me to go faster.

### Building a ship in a bottle

Working on a client managed device can impose constraints on the tools and processes available, much like building a ship in a bottle.

1. **Build the ship outside of a bottle**: Solve any technical issues without the constraints of the bottle, while keeping them in mind.
2. **Build the ship in the bottle**: Solve any remaining bottle related issues when deploying.

Building client solutions in a 'private kitchen' environment with all the tools, processes, documentation and services I need is faster than doing it all on a client managed device.

![](../assets/ship-in-a-bottle.png)

### Private Kitchen Patterns

There are a number of problems to solve. I'm still working through them.

1. **Dev Services**: I need access to the same services the client wants me to deploy my solution to (e.g. AWS, Azure)
2. **Waiters**: How to transfer data between my "private kitchen" device and the client managed device. Notes, code, commands, error messages.
3. **Wrap client git repo**: Develop in a private git repo that has the client repo checked out to a subdirectory.