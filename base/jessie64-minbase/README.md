# Docker base container for Debian Jessie amd64 minbase

Minimal base image for Jessie.

Dependencies:
 * debootstrap
 * debian-archive-keyring (optional)

To install dependencies on Arch Linux:

    pacman -S wget
    
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/debootstrap.tar.gz
    tar xfz debootstrap.tar.gz
    cd debootstrap
    makepkg
    sudo pacman -U debootstrap-*.xz
    cd ..
    
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/debian-archive-keyring.tar.gz
    tar xfz debian-archive-keyring.tar.gz
    cd debian-archive-keyring
    makepkg
    sudo pacman -U debian-archive-keyring-*.xz
    cd ..
    
    gpg --recv-keys 0x2071B08A33BD3F06
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/gnupg1.tar.gz
    tar xfz gnupg1.tar.gz
    cd gnupg1
    makepkg
    sudo pacman -U gnupg1-*.xz
    cd ..

Creating the Docker base image:

    sudo ./create_base_container.sh


Thanks to Jonathan Dowland for inspiration:
https://github.com/jmtd/debian-docker/tree/master/build
