# Development Setup for Forked Projects

When contributing to a Python project via fork, you often want to:
1. Use your development version locally
2. Keep up with upstream changes
3. Maintain multiple feature branches
4. Have system-wide access to your version

## Virtual Environment Setup

Create a dedicated virtualenv for development:
```bash
# Create venv in a standard location
python -m venv ~/.local/venv/project-dev

# Install your development version
~/.local/venv/project-dev/bin/pip install -e ~/path/to/your/fork

# Make it available system-wide via symlink
ln -sf ~/.local/venv/project-dev/bin/project ~/.local/bin/project
```

## Git Remote Setup

Configure your fork to track upstream:
```bash
# Add upstream remote
git remote add upstream https://github.com/original/project.git

# Keep main up to date with upstream
git fetch upstream
git checkout main
git rebase upstream/main
```

## Managing Feature Branches

1. Create feature branches from main
```bash
git checkout main
git pull upstream main
git checkout -b feat/new-feature
```
2. Submit PRs from feature branches to upstream/main
3. If PRs take time to merge:
   - Keep personal dev branch for local use
   - Merge desired features into dev
   - Rebase dev on main regularly

## Benefits

This setup provides:
- Isolated dependencies in virtualenv
- System-wide access via symlink
- Immediate code changes with pip -e
- Easy version switching
- Clean git history for PRs

## Example: Multiple Versions

To maintain both stable and development versions:
```bash
# Stable version via pipx
pipx install project-name

# Development version in virtualenv
python -m venv ~/.local/venv/project-dev
~/.local/venv/project-dev/bin/pip install -e ~/path/to/your/fork

# Switch between versions by changing symlink
ln -sf ~/.local/venv/project-dev/bin/project ~/.local/bin/project
ln -sf $(pipx environment -v | grep PIPX_BIN_DIR | cut -d= -f2)/project ~/.local/bin/project
```
