FROM docker.io/library/archlinux:latest

COPY install_zfs.sh /tmp/install_zfs.sh
COPY zfsrepo.conf /root/zfsrepo.conf

WORKDIR /root

RUN set -xe ;\
  pacman --noconfirm -Syu archiso sudo base-devel git ;\
  cp -r /usr/share/archiso/configs/releng /root/archzfs ;\
  useradd --home-dir /tmp/archzfs --create-home archzfs ;\
  cat /root/zfsrepo.conf >> /root/archzfs/pacman.conf ;\
  chmod -v 0755 /tmp/install_zfs.sh ;\
  sudo -u archzfs /tmp/install_zfs.sh

COPY archzfs/packages.x86_64 /root/archzfs/packages.x86_64

CMD [ "bash", "-xe", "-c", \
  "pwd; id; umask 0000; mkarchiso -v -r -w /tmp/archiso-tmp -o /tmp/archiso-out /root/archzfs" \
]
