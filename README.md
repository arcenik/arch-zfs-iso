# Arch ISO with ZFS support

Build an ArchLinux ISO image with ZFS included.

## Build the ISO image using Docker

### Build the Docker helper image

Check the AUR in the **install_zfs.sh** script and adjust them if you need a specific version for the latest kernel and build the image.

```sh
docker build -t archzfs:latest --progress=plain .
```

### Build the ISO image with volume mapping to get the result

Adjust the volume mount binding to your preference and run the docker image.

```sh
docker run -ti --rm --privileged \
  --name archzfs-builder \
  -v ~/tmp/archzfs:/tmp/archiso-out \
  archzfs:latest
```
