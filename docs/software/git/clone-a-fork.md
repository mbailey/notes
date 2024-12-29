---
alias: Clone a fork
---
# Clone a fork

Clone your forked repo and add the upstream as a remote.

## Clone your fork

1. **Fork the Repository**: Go to the GitHub page of the repository you want to fork and click the "Fork" button.
    
2. **Clone Your Fork**: Clone your fork to your local machine using the command:
    
    ```bash
    git clone <your-fork-url>  
    ```
    
3. **Add Upstream Remote**: Add the original repository as an upstream remote:
    
    ```bash
    git remote add upstream <original-repo-url>  
    ```
    
4. **Create a branch called `upstream-main`**: To view the upstream main branch without your changes, you can create a local branch tracking it:
    
    ```bash
    git fetch upstream
    git checkout -b upstream-main upstream/main  
    ```

## Update your fork with upstream changes

1. **Fetch Upstream Changes**: Fetch changes from the upstream repository:
    
    ```bash
    git fetch upstream  
    ```
    
5. **Rebase Your Fork**: Rebase your fork's main branch on the upstream main branch:
    
    ```bash
    git checkout main  
    git pull --rebase upstream main  
    ```
    
6. **Push Changes to Your Fork**: Push the updated main branch to your fork:
    
    ```bash
    git push origin main  
    ```

## Checkout Upstream main
    
1. **Check Out Upstream Main**: To view the upstream main branch without your changes, you can switch to the branch we created initially.

    ```shell
    git switch upstream-main
    ```
    
2. **Switch Back to Your Main**: Switch back to your own main branch when done:
    
    ```bash
    git switch main  
    ```
    

[media pointer="sediment://file_f1e4bf5c9604303c26e2a06cc6fbb977395159a8cb10a5b7ba7dcc96e8dcc9b1df462079404e2aa8e6e8de6740b5d9d4"]



Example `.git/config`:

```
[core]
    repositoryformatversion = 0
    filemode = true
    bare = false
    logallrefupdates = true
[remote "origin"]
    url = git@github.com_mbailey:ailocal/aider.git
    fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
    remote = origin
    merge = refs/heads/main
[remote "upstream"]
    url = https://github.com/Aider-AI/aider.git
    fetch = +refs/heads/*:refs/remotes/upstream/*
[branch "upstream"]
    remote = upstream
    merge = refs/heads/main
```