echo "Enter hostname:"
read hostname
hostnamectl set-hostname $hostname

echo "Please set a Static IP Address using the Armbian Config"

apt update && apt upgrade -y
curl -sSL https://get.docker.com/ | sh

# Disable IPv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf


apt install software-properties-common
add-apt-repository ppa:gluster/glusterfs-4.1
apt update
apt install glusterfs-client
