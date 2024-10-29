# Git Commit Conventions

Git commit messages help track and understand changes in a project. Using consistent commit message conventions makes it easier to automate changelog generation, version management, and code review. Here are some popular commit message formats:

### Conventional Commits

A specification for adding human and machine readable meaning to commit messages. [Learn more](https://www.conventionalcommits.org/)

| Prefix | Description |
|--------|-------------|
| feat | New features or significant changes to functionality |
| fix | Bug fixes |
| docs | Documentation changes only |
| style | Code style/formatting changes (no code change) |
| refactor | Code changes that neither fix bugs nor add features |
| test | Adding or modifying tests |
| chore | Maintenance tasks, dependency updates, etc. |
| perf | Performance improvements |
| ci | Changes to CI/CD configuration and scripts |
| build | Changes to build system or external dependencies |
| revert | Reverting a previous commit |

### Ember.js Convention

The commit style used by the Ember.js project and community. [Learn more](https://github.com/emberjs/ember.js/blob/master/CONTRIBUTING.md#commit-tagging)

| Prefix | Description |
|--------|-------------|
| [FEATURE] | New features |
| [BUGFIX] | Bug fixes |
| [DOC] | Documentation changes |
| [SECURITY] | Security fixes |
| [CLEANUP] | Code cleanup or refactoring |
| [DEPRECATION] | Deprecation notices |
| [BREAKING] | Breaking changes |

### GNU Style

A simple prefix-based style used in GNU projects. [Learn more](https://www.gnu.org/prep/standards/html_node/Change-Logs.html)

| Prefix | Description |
|--------|-------------|
| add: | Adding new files/features |
| rm: | Removing files/features |
| fix: | Bug fixes |
| mod: | Modifications to existing functionality |
| doc: | Documentation updates |

### Laravel Style

The commit convention used in Laravel framework development. [Learn more](https://laravel.com/docs/contributions#coding-style)

| Prefix | Description |
|--------|-------------|
| [Feature] | New features |
| [Fix] | Bug fixes |
| [Docs] | Documentation changes |
| [Style] | Code style changes |
| [Refactor] | Code refactoring |
| [Test] | Test additions or changes |
| [Chore] | Maintenance tasks |

Each of these standards can be further customized with scopes or additional categories based on project needs. For example:

- `feat(auth): add OAuth support`
- `fix(database): resolve connection timeout`