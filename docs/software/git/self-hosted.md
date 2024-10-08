# self-hosted

Add a git remote to a server you have SSH access to.

1. On the Git server:
   ```
   mkdir /path/to/repo.git
   cd /path/to/repo.git
   git init --bare
   ```

2. On your local machine:
   ```
   cd /path/to/local/repo
   git remote add origin user@git-server:/path/to/repo.git
   git push -u origin master
   ```
