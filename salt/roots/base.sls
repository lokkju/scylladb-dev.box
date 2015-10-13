install pre-requisites:
  pkg.installed:
    - names:
      - epel-release
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

install scylladb:
  pkg.installed:
    - names:
      - scylla-server
      - scylla-jmx
      - scylla-tools

/var/lib/scylla/conf/scylla.yaml:
  file.managed:
    - source: salt://conf/scylla.yaml
    - user: root
    - group: root
    - mode: 644
    - template: jinja

scylla-server:
  service.running:
    - enable: True

scylla-jmx:
  service.running:
    - enable: True
