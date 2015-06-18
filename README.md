Debian Packages for libRETS
===========================

This is a set of Debian packaging files for libRETS
(http://nationalassociationofrealtors.github.io/libRETS/).  Using these
and the libRETS source, you should be able to build "librets1" and
"librets-dev" packages.

This has been developed on Ubuntu 14.04, and should work on any recent
Ubuntu or Debian release.

PPA
---

There is a PPA at:

    https://launchpad.net/~sysadm-k/+archive/ubuntu/librets

Building
--------

Steps to build deb files:

    - Download the libRETS tar file from the above URL
    - Rename into Debian-compatible format
    - Clone this repository
    - Extract into top level directory with "--strip-components=1".
    - Run "debuild".
    - Deb files should be in parent directory.

Sample run:

    wget https://github.com/NationalAssociationOfRealtors/libRETS/archive/1.6.1.tar.gz
    mv 1.6.1.tar.gz librets_1.6.1.orig.tar.gz
    mkdir librets-package
    cd librets-package
    git clone http://github.com/realgo/librets-package.git debian
    tar xf ../librets_1.6.1.orig.tar.gz --strip-components=1
    debuild
    cd ..
    sudo dpkg -i *.deb
