# archiso
- Archiso configs
- https://wiki.archlinux.org/index.php/archiso

## Features
### Bloat
- Contains many packages
- i3
- Telegram
- pacaur
- Firefox Developer
- atom with packages
- `$ bootstrap` to apply patches to the live system

#### Default Credentials
- `arch`; `password`
- `root`; `password`

## Build ISO
- `sudo ./build.sh -v`

## Development Process
- Build the image
- Boot image in vm
- Take snapshot
- Clone the archiso repo and test the config scripts
- If it does not work, fix the scripts, restore image, repeat
- Build the image again, this time including the customizations

## Installing Archiso to disk
- Boot to grub/syslinux
- Press TAB on boot entry
  - Append `cow_spacesize=512M`
- `pacman -Sy git`
- `git clone https://github.com/egeldenhuys/aui`
- `cd aui`
- `./fifo`
