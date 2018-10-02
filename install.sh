apt update && apt upgrade -y

apt install -y \
  automake autoconf apt-transport-https \
  ca-certificates curl \
  git golang-go \
  libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev \
  pkg-config \
  software-properties-common screen \
  xfsprogs 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
add-apt-repository ppa:gluster/libntirpc-1.7 -y
add-apt-repository ppa:gluster/glusterfs-4.1 -y
add-apt-repository ppa:gluster/glusterd2-4.1 -y

apt update
apt install -y docker-ce glusterd2-* glusterfs-* libntirpc*
apt upgrade -y
