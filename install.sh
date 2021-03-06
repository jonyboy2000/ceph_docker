#!/bin/sh
yum update -y -v
rpm -Uvh https://download.ceph.com/rpm-jewel/el7/noarch/ceph-release-1-1.el7.noarch.rpm
#rpm -Uvh http://ceph.com/rpm/el7/noarch/ceph-release-1-0.el7.noarch.rpm
yum install   python-itsdangerous python-werkzeug python-jinja2 python-flask  -y 
yum install   openssh openssh-server openssh-clients hostname -y -q
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
cat ~/.ssh/id_rsa.pub |awk '{print $1, $2, "Generated"}' >> ~/.ssh/authorized_keys2
cat ~/.ssh/id_rsa.pub |awk '{print $1, $2, "Generated"}' >> ~/.ssh/authorized_keys

yum install  -y -q ceph-deploy epel-release iproute
yum install -y ceph
