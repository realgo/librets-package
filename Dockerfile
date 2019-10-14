ARG UBUNTU_VERSION=18.04
ARG LIBRETS_VERSION

FROM ubuntu:$UBUNTU_VERSION AS builder

ENV LIBRETS_VERSION=${LIBRETS_VERSION:-1.6.4}

RUN apt -y update
RUN apt -y install wget devscripts
RUN apt -y install debhelper python-dev python3-dev python-all python3-all libexpat1-dev libcurl4-openssl-dev libboost-dev libboost-filesystem-dev libantlr-dev swig libcppunit-dev dh-autoreconf dh-python
RUN apt -y install default-jdk-headless
#openjdk-7-jre-headless | openjdk-7-jre | default-jre-headless | default-jdk-headless

RUN mkdir -p libRETS-${LIBRETS_VERSION}/debian
COPY . libRETS-${LIBRETS_VERSION}/debian
RUN wget https://github.com/NationalAssociationOfRealtors/libRETS/archive/${LIBRETS_VERSION}.tar.gz
RUN mv ${LIBRETS_VERSION}.tar.gz librets_${LIBRETS_VERSION}.orig.tar.gz
RUN tar xf librets_${LIBRETS_VERSION}.orig.tar.gz
WORKDIR libRETS-${LIBRETS_VERSION}
RUN debuild --no-sign
WORKDIR ..
RUN mkdir -p build
RUN mv *.deb build/

FROM ubuntu:$UBUNTU_VERSION

RUN mkdir -p build
COPY --from=builder build/* build/
#  may fail due to dependencies, fixed in next line
RUN dpkg -i build/*.deb || true
RUN apt --fix-broken -y install
