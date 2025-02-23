# Remove pre-commit from git repo

by Claude.ai

To remove pre-commit (the Python tool) from a Git repository, you'll need to take a few steps:

1. Remove the pre-commit configuration file:
   Delete the `.pre-commit-config.yaml` file from your repository.

2. Uninstall pre-commit hooks:
   Run the following command in your repository:
   ```
   pre-commit uninstall
   ```

3. Remove pre-commit from your project dependencies:
   If you've listed pre-commit in your project's requirements file (e.g., requirements.txt or pyproject.toml), remove it.

4. Delete the .git/hooks/pre-commit file:
   This file may have been created by pre-commit. You can safely delete it.

5. Commit these changes:
   ```
   git add .
   git commit -m "Remove pre-commit configuration"
   ```

6. Optionally, uninstall pre-commit from your system:
   If you no longer need pre-commit for any projects, you can uninstall it:
   ```
   pip uninstall pre-commit
   ```
