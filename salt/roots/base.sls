install pre-requisites:
  pkg.installed:
    - names:
      - epel-release
      - dnsmasq

scylla.repo:
  pkgrepo.managed:
    - humanname: Scylla for Centos $releasever - $basearch
    - baseurl: https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/$releasever/$basearch/
    - enabled: 1
    - gpgcheck: 0

scylla-generic.repo:
  pkgrepo.managed:
    - humanname: Scylla for centos $releasever
    - baseurl: https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/$releasever/noarch/
    - enabled: 1
    - gpgcheck: 0

scylla-3rdparty.repo:
  pkgrepo.managed:
    - humanname: Scylla 3rdParty for Centos $releasever - $basearch
    - baseurl: https://s3.amazonaws.com/downloads.scylladb.com/rpm/3rdparty/centos/$releasever/$basearch/
    - enabled: 1
    - gpgcheck: 0

#remove conflicting boost packages:
#  pkg.removed:
#    - names:
#      - boost-thread
#      - boost-system

install scylladb:
  pkg.installed:
    - names:
      - scylla-server
      - scylla-jmx
      - scylla-tools

scylla-server:
  service.running:
    - enable: True

scylla-jmx:
  service.running:
    - enable: True
