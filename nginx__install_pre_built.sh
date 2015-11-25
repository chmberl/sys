#!/bin/bash

# Installing a Pre-built Package
sudo yum -y update

wget http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

sudo rpm -ivh nginx-release-centos-7-0.el7.ngx.noarch.rpm

sudo yum -y install nginx

