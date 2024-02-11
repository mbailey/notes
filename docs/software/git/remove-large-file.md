# Remove large file from Git repo

**[100 times faster than git filter-branch and simpler (stackoverflow.com)](https://stackoverflow.com/a/61602985/660017)**

> Warning: Do this on a copy of your repository. Many actions of filter-repo cannot be undone. filter-repo will change the commit hashes of all modified commits (of course) and all their descendants down to the last commits!

First you can run:

    git filter-repo --analyze

This helps you to determine what to do next.

 ![Pasted image 20230128143028](../../assets/Pasted%20image%2020230128143028.png)

You can delete your big mp3 file everywhere:

    git filter-repo --invert-paths --path-match bigfile.mp3