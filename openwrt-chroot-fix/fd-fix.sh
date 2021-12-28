ln -s /proc/self/fd /dev/fd && test -L /dev/shm && rm /dev/shm && mkdir /dev/shm && mount -t tmpfs -o nosuid,nodev,noexec shm /dev/shm && chmod 1777 /dev/shm
