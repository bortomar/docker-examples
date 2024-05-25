#!/bin/bash

# 1. If directory "random-files-host" does not exist on host it will be created with coresponding name (both host and container)
# with root privileges so user attached to container will be unable to create random file and bash won't be started.

docker run --rm -it -v "$(pwd)/random-files-host":/random-files-container -u $(id -u):$(id -g) centos:6 \
sh -c " mktemp /random-files-container/XXXXX &> /dev/null && bash"

# 2. Without specifing user all created files will have root owner and group.
#docker run --rm -it -v "$(pwd)/random-files-host":/random-files-container centos:6 sh -c " mktemp /random-files-container/XXXXX &> /dev/null && bash"


# !!! NOTE: On Debian 12 the CentOS 6 container runs only if there is following line in /etc/default/grub:
# GRUB_CMDLINE_LINUX="vsyscall=emulate"
