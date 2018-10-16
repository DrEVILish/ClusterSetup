#!/bin/bash
#
# To setup Odroid run the below command on Armbian Ubuntu Host Machine
# wget https://raw.githubusercontent.com/DrEVILish/ClusterSetup/master/installOdroid.sh
# chmod +x ./installOdroid.sh
# ./installOdroid.sh h01
#

hostnamectl set-hostname $1

echo "Please set a Static IP Address for $1 $(</sys/class/net/eth0/address)"

# Disable IPv6 use only IPv4
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf

apt update && apt upgrade -y
apt install -yqq curl htop smartmontools
apt autoremove -y
# curl -sSL https://get.docker.com/ | sh

apt-get install -y software-properties-common xfsprogs
add-apt-repository ppa:gluster/libntirpc-1.7 -y
add-apt-repository ppa:gluster/glusterfs-4.1 -y
add-apt-repository ppa:gluster/glusterd2-4.1 -y
apt-get update
apt-get install -y glusterfs-* libntirpc*

systemctl start glusterd
systemctl enable glusterd

echo "Please reboot before continuing with HDD config."
