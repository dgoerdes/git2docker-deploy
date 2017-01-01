# git2docker-deploy
Just a little frame with some code snippets to set up an easy auto deployment process on a VPS.



## Create git Repo
Add a new user and set it up accordingly (SSH Key, rights etc.)
to create a git repo on this users home directory.

`mkdir ~/app`

`cd ~/app`

`git init --bare`

The created repo can be added as a remote on the client like follows:

`git remote add production user@server:app`



## Add post-receive hook
Copy over the `post-receive` script from this repo to the new server repositories hooks folder.
Also copy the `deploy.sh` script to the home directory.

Both files need execute rights! (`chmod +x /home/user/deploy.sh`)
