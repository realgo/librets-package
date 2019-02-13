Debian Packages for libRETS
===========================

This is a set of Debian packaging files for libRETS
( https://github.com/NationalAssociationOfRealtors/libRETS/releases ).
Using these and the libRETS source, you should be able to build
"librets1" and "librets-dev" packages.

This has been developed on Ubuntu 14.04, and should work on any recent
Ubuntu or Debian release.

PPA
---

There is a PPA for Ubuntu Trusty at:

    https://launchpad.net/~sysadm-k/+archive/ubuntu/librets

Building
--------

NOTE: This asumes the 1.6.2 version.  If you are building a different version,
Change the version number in the commands below and **ALSO** change
"debian/changelog" where it says "1.6.2" to the version you are building.

Steps to build deb files:

- Download the libRETS tar file from the above URL

```bash
wget https://github.com/NationalAssociationOfRealtors/libRETS/archive/1.6.2.tar.gz
```

- Rename into Debian-compatible format

```bash
mv 1.6.2.tar.gz librets_1.6.2.orig.tar.gz
```

- Extract tar file

```bash
tar xf librets_1.6.2.orig.tar.gz
```

- Clone this repository to "debian" sub-directory

```bash
cd libRETS-1.6.2
git clone https://github.com/realgo/librets-package debian
```

- Run "debuild".
- Deb files should be in parent directory.

Sample run:

```bash
wget https://github.com/NationalAssociationOfRealtors/libRETS/archive/1.6.2.tar.gz
mv 1.6.2.tar.gz librets_1.6.2.orig.tar.gz
tar xf librets_1.6.2.orig.tar.gz
cd libRETS-1.6.2
git clone https://github.com/realgo/librets-package debian
debuild
cd ..
sudo dpkg -i *.deb
```
