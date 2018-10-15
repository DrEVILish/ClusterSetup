#!/bin/bash
#
# To setup Odroid run the below command on Ubuntu Host Machine
# wget https://raw.githubusercontent.com/DrEVILish/ClusterSetup/master/installOdroid.sh
# chmod +x ./installOdroid.sh
# ./installOdroid.sh h01
#

hostnamectl set-hostname $1

echo "Please set a Static IP Address for $1 $(</sys/class/net/eth0/address)"

apt update && apt upgrade -y
apt install -yqq curl sysfsutils
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

touch /etc/default/cpufrequtils
echo 'ENABLE="true"' >> /etc/default/cpufrequtils 
echo 'GOVERNOR="performance"' >> /etc/default/cpufrequtils
echo 'MAX_SPEED=1900000' >> /etc/default/cpufrequtils
echo 'MIN_SPEED=1900000' >> /etc/default/cpufrequtils

echo "devices/platform/11800000.mali\:/devfreq/11800000.mali\:/governor = powersave" >> /etc/sysfs.conf
service sysfsutils start
fallocate -l 1G /var/swapfile
chmod 600 /var/swapfile
mkswap /var/swapfile
swapon /var/swapfile
echo "/var/swapfile    none    swap    sw    0    0" >> /etc/fstab


echo "Please reboot before continuing with HDD config."
