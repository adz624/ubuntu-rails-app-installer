## Summary
==========================
ubuntu-rails-app-installer is a shell script and you can use these scripts to install rails app production environment quickly!

## Usage

```sh
# 1. Download and install the common package for your ubuntu, you will have a ./install folder when the process done.
\curl https://raw.github.com/afunction/ubuntu-rails-app-installer/master/_init.sh | bash

# if you run this shell via ssh to remote server and your connection is unstable
# Recommand use tmux to keep session live
# When lost connection, you can type `tmux attach` to find back your session

# 2. Setting your bash
cd installer
./install-bash.sh

# 3. Install Percona 5.5
./install-percona.sh

# 4. Install Nginx
./install-nginx.sh

# 6. [Optional] Redis-server (if you use resque, sidekiq you need it)
./install-redis.sh

# 7. SSH Setting
#    [NOTICE] It will disable SSH password auth,
#             Make sure your public key in `~root/.ssh/authorized_keys`,
#             before you run this script
./setup-ssh.sh

# 8. Install rails app deploy user, tools, libraries .. etc
./install-railsapp.sh
```
