#! /bin/bash

mkdir /tmp/archzfs/repo

cd /tmp/archzfs/
git clone https://aur.archlinux.org/zfs-dkms.git 
cd zfs-dkms
makepkg -s --skippgpcheck
mv -v *.pkg.tar.zst  /tmp/archzfs/repo/

cd /tmp/archzfs/
git clone https://aur.archlinux.org/zfs-utils.git 
cd zfs-utils
makepkg -s --skippgpcheck
mv -v *.pkg.tar.zst  /tmp/archzfs/repo/

cd /tmp/archzfs/repo
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
ls -lah
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
repo-add zfsrepo.db.tar.gz *.pkg.tar.zst
