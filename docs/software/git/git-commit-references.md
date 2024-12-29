---
alias: Git Commit References
---
# Git Commit References

## Common Syntax

- `HEAD`: Current commit
- `HEAD^` or `HEAD~1`: Previous commit
- `HEAD^^` or `HEAD~2`: Two commits back
- `HEAD^^^` or `HEAD~3`: Three commits back
- `HEAD^2`: Second parent of a merge commit

## Usage Examples

### Git Log

```bash
# Last 3 commits
git log HEAD~3..HEAD

# Show commits between two points
git log HEAD~5..HEAD~2

# Graph view of last 4 commits
git log --graph HEAD~4..HEAD
```

### Git Rebase

```bash
# Interactive rebase of last 3 commits
git rebase -i HEAD~3

# Rebase onto specific commit
git rebase -i HEAD~5
```

### Git Show

```bash
# Show previous commit
git show HEAD^

# Show second parent of merge commit
git show HEAD^2

# Show three commits ago
git show HEAD~3
```

### Git Diff

```bash
# Changes between current and previous
git diff HEAD^

# Changes between two ancestors
git diff HEAD~2 HEAD

# Changes in specific file from 2 commits ago
git diff HEAD^^ path/to/file
```

## Important Notes

- `^` vs `~`: Both count back commits but behave differently on merge commits
  - `^` follows first parent in merges
  - `~` follows history linearly
- Multiple `^` can be chained: `^^^^` = 4 commits back
- Combine with numbers: `~5` = 5 commits back
- Works with commit hashes too: `abc123^`
