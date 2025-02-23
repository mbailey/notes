# Obsidian markdown heading anchors incompatible with other tools

One benefit of teams using Git/Markdown for documentation is that team members
can use their preferred editors. 

Obsidian's way of creating / consuming Markdown links to Headings that contain
spaces is incompatible with most other tools (including VSCode and GitHub.com).

This means links to headings with spaces won't work.


## Background

There are two distinct issues with spaces in Markdown links:

1. **Link Destinations with Spaces** (well-defined by CommonMark):
       - Must be enclosed in angle brackets
       - Invalid: `[link](/my file.md)`  
       - Valid: `[link](<my file.md>)`
       - When rendered, spaces are automatically percent-encoded (%20)

2. **Links to Headings with Spaces** (not specified by CommonMark):
       - No standardized way to handle spaces in heading IDs/anchors
       - Tools implement different approaches:
         - Most replace spaces with hyphens (e.g., `#my-heading`)
         - Some (including Obsidian) use URL encoding (e.g., `#My%20Heading`)


**Examples ([View on GitHub.com](https://github.com/mbailey/notes/blob/master/docs/software/apps/obsidian/issues/markdown-heading-anchors.md)):**

- [`#proposed-solutions`](#proposed-solutions) 
- [`#Proposed%20Solutions`](#Proposed%20Solutions)

Handling of spaces in Markdown anchor links by different tools.

| Tool     | Space Replacement     | Notes                     |
| -------- | --------------------- | ------------------------- |
| Obsidian | URL Encoding (%20)    |                           |
| GitHub   | Hyphens               |                           |
| VSCode   | Hyphens               |                           |
| MkDocs   | Hyphens               |                           |
| GitLab   | Hyphens (unconfirmed) |                           |
| Hugo     | Hyphens (unconfirmed) | Configurable via settings |
| Jekyll   | Hyphens (unconfirmed) | Configurable via settings |
| Pandoc   | Hyphens (unconfirmed) | Also removes punctuation  |

## Proposed Solutions

### 1. Make Markdown heading link space substitution configurable

This would allow the user to decide whether Obsidian should replace spaces with hyphens or %20 when generating Markdown links to headings with spaces in them.

### 2. Add Obsidian support for viewing both types of links

This would make hyphenated links work in Obsidian but would not solve the
problem of Obsidian creating links incompatible with other tools.

It would work well with 1. to ensure legacy files (using `%20`) still work regardless of the configured default.

The implementation would have to define how to handle ambiguous heading references, where two two headings differ only by spaces vs hyphens.

```
### My-Heading
### My Heading
```

## Implementation

1. **Community Plugin**: Develop an Obsidian plugin that changes it's behaviour.
   - Pros: Non-invasive, opt-in solution
   - Cons: Requires plugin development and maintenance

2. **Feature Request**: Submit a feature request to Obsidian for configurable support so users can choose. 
   - Pros: Would solve the issue at the source
   - Cons: No guarantee of implementation, potentially long timeline

