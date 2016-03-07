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

There is a PPA for Ubuntu Trusty at:

    https://launchpad.net/~sysadm-k/+archive/ubuntu/librets

Building
--------

NOTE: This asumes the 1.6.1 version.  If you are building a different version,
Change the version number in the commands below and **ALSO** change
"debian/changelog" where it says "1.6.1" to the version you are building.

Steps to build deb files:

- Download the libRETS tar file from the above URL

    wget https://github.com/NationalAssociationOfRealtors/libRETS/archive/1.6.1.tar.gz

- Rename into Debian-compatible format

    mv 1.6.1.tar.gz librets_1.6.1.orig.tar.gz
    #  or:
    mv libRETS-1.6.1.tar.gz librets_1.6.1.orig.tar.gz

- Extract tar file

    tar xf librets_1.6.1.orig.tar.gz

- Clone this repository to "debian" sub-directory

    cd libRETS-1.6.1
    git clone https://github.com/realgo/librets-package debian

- Run "debuild".
- Deb files should be in parent directory.

Sample run:

    wget https://github.com/NationalAssociationOfRealtors/libRETS/archive/1.6.1.tar.gz
    mv 1.6.1.tar.gz librets_1.6.1.orig.tar.gz
    tar xf librets_1.6.1.orig.tar.gz
    cd libRETS-1.6.1
    git clone https://github.com/realgo/librets-package debian
    debuild
    cd ..
    sudo dpkg -i *.deb
