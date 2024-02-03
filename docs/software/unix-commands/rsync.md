# rsync

Change user on remote host (to access their homedir):

    rsync -avz --rsync-path 'sudo -u someuser rsync' somehost:files/ somehost-files/


Don't copy files Git ignores:

    rsync -avz --filter=':- .gitignore' foo remote_host:bar
