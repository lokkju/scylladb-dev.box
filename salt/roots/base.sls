install pre-requisites:
  pkg.installed:
    - names:
      - epel-release

install scylladb:
  pkgrepo.managed:
    - name: scylla
    - humanname: Scylla for Centos $releasever - $basearch
    - mirrorlist: https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/$releasever/$basearch/
    - enabled: 1
    - gpgcheck: 0
  pkgrepo.managed:
    - name: scylla-generic
    - humanname: Scylla for centos $releasever
    - mirrorlist: https://s3.amazonaws.com/downloads.scylladb.com/rpm/centos/$releasever/noarch/
    - enabled: 1
    - gpgcheck: 0
  pkgrepo.managed:
    - name: scylla-3rdparty
    - humanname: Scylla 3rdParty for Centos $releasever - $basearch
    - mirrorlist: https://s3.amazonaws.com/downloads.scylladb.com/rpm/3rdparty/centos/$releasever/$basearch/
    - enabled: 1
    - gpgcheck: 0

  pkg.removed:
    - names:
      - boost-thread
      - boost-system
  pkg.installed:
    - names:
      - scylla-server
      - scylla-jmx
      - scylla-tools

