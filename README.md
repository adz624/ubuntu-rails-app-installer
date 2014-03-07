## Summary
==========================
ubuntu-rails-app-installer is a shellscript and make you install the rails app production environment!

This shell test on ubuntu 12.04, 13.04 already.

## Usage

```sh
# 1. Download and install the common package for your ubuntu, you will have a ./install folder when the process done.
\curl https://raw.github.com/afunction/ubuntu-rails-app-installer/master/_init.sh | bash

# 2. Setting your bash 
cd installer
./install-bash.sh

# 3. Install Percona 5.5
./install-percona.sh

# 4. Install Nginx 
./install-nginx.sh

# 5. Install rails app (rvm, deploy user ... etc)
./install-railsapp.sh
```



