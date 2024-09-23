# Set python version in a folder

To set a specific Python version for a particular Git repository using pyenv, you can follow these steps:

1. Navigate to the root directory of your Git repository in the terminal.

2. Create a `.python-version` file in the repository root with the desired Python version. You can do this by running:

   ```
   echo "3.9.5" > .python-version
   ```

   Replace "3.9.5" with the specific Python version you want to use.

3. Alternatively, you can use the `pyenv local` command to set the local Python version:

   ```
   pyenv local 3.9.5
   ```

   This command will create the `.python-version` file for you.

4. Verify that the correct version is set by running:

   ```
   pyenv version
   ```

   It should display the version you just set.

Now, whenever you're in this Git repository or any of its subdirectories, pyenv will automatically use the specified Python version.

Remember to ensure that you have installed the desired Python version using pyenv before setting it as the local version. You can install a specific version with:

```
pyenv install 3.9.5
```

Would you like me to explain any part of this process in more detail?

