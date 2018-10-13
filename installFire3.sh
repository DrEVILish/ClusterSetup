echo "Enter hostname:"
read hostname
hostnamectl set-hostname $hostname

echo "Please set a Static IP Address using the Armbian Config"

apt update && apt upgrade -y
curl -sSL https://get.docker.com/ | sh

wget -O - https://download.gluster.org/pub/gluster/glusterfs/4.1/rsa.pub | apt-key add -
DEBID=$(grep 'VERSION_ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
DEBVER=$(grep 'VERSION=' /etc/os-release | grep -Eo '[a-z]+')
DEBARCH=$(dpkg --print-architecture)
echo deb https://download.gluster.org/pub/gluster/glusterfs/LATEST/Debian/${DEBID}/${DEBARCH}/apt ${DEBVER} main > /etc/apt/sources.list.d/gluster.list
apt-get update
apt-get install glusterfs-client
