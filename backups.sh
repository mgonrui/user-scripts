#!/bin/sh
# always make shure to test your rsync commands with --dry-run to test everything works as expected
# before doing the real thing
# rsync --dry-run -aAXvz --delete-missing-args --delete /etc/nixos /mnt
# rsync --dry-run -aAXvz --delete-missing-args --delete --exclude=/mgr/.cache /home/mgr /mnt

rsync -aAXvz --delete-missing-args --delete /etc/nixos /mnt/b/backup_home
rsync -aAXvz --delete-missing-args --delete --exclude=/mgr/.cache /home/mgr /mnt/b/backup_nixconfig
