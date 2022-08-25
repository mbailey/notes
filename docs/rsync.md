# rsync

Change user on remote host (to access their homedir):

    rsync -avz --rsync-path 'sudo -u someuser rsync' somehost:files/ somehost-files/
