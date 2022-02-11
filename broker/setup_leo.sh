#!/bin/bash

update() {
  yum -y upgrade
}

install_tools() {
  yum -y install \
    net-tools \
    bind-utils \
    curl wget
}

install_gateway() {
  curl -L http://downloads.leostream.com/gateway.sh | bash
}

install_broker() {
  curl -L http://downloads.leostream.com/broker.prod.sh | bash
}

patch_httpd(){
  # run on un priviledge ports
  sed -i 's/Listen 80.*/Listen 8080/' /etc/httpd/conf/httpd.conf
  sed -i 's/Listen 443.*/Listen 8443/' /etc/httpd/conf.d/ssl.conf

  firewall-cmd --add-port=8080/tcp --permanent
  firewall-cmd --add-port=8443/tcp --permanent

  # remove redirects, etc
  sed -i '/# Send all http to https/,$ s/^/#/' /etc/httpd/conf.d/leo.conf

  # do we really need cups?
  systemctl disable cups

}

# TODO: run redis as a container

update
install_tools
#install_gateway
install_broker
patch_httpd

reboot
