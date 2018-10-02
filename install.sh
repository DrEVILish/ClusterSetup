# OdroidSetup
echo "Enter hostname:"
read varname

hostnamectl set-hostname %hostname%

echo 192.168.1.191 g01 >> /etc/hosts
echo 192.168.1.192 g02 >> /etc/hosts
echo 192.168.1.193 g03 >> /etc/hosts
echo 192.168.1.194 g04 >> /etc/hosts
echo 192.168.1.195 g05 >> /etc/hosts
echo 192.168.1.196 g06 >> /etc/hosts
echo 192.168.1.197 g07 >> /etc/hosts
echo 192.168.1.198 g08 >> /etc/hosts
echo 192.168.1.199 g09 >> /etc/hosts
echo 192.168.1.200 g10 >> /etc/hosts
echo 192.168.1.201 g11 >> /etc/hosts
echo 192.168.1.202 g12 >> /etc/hosts
echo 192.168.1.203 g13 >> /etc/hosts
echo 192.168.1.204 g14 >> /etc/hosts
echo 192.168.1.205 g15 >> /etc/hosts
echo 192.168.1.206 g16 >> /etc/hosts
echo 192.168.1.207 g17 >> /etc/hosts
echo 192.168.1.208 g18 >> /etc/hosts
echo 192.168.1.209 g19 >> /etc/hosts
echo 192.168.1.210 g20 >> /etc/hosts
echo 192.168.1.211 g21 >> /etc/hosts
echo 192.168.1.212 g22 >> /etc/hosts
echo 192.168.1.213 g23 >> /etc/hosts
echo 192.168.1.214 g24 >> /etc/hosts
echo 192.168.1.215 g25 >> /etc/hosts
echo 192.168.1.216 g26 >> /etc/hosts
echo 192.168.1.217 g27 >> /etc/hosts
echo 192.168.1.218 g28 >> /etc/hosts
echo 192.168.1.219 g29 >> /etc/hosts
echo 192.168.1.220 g30 >> /etc/hosts
echo 192.168.1.221 g31 >> /etc/hosts
echo 192.168.1.222 g32 >> /etc/hosts
echo 192.168.1.223 g33 >> /etc/hosts
echo 192.168.1.224 g34 >> /etc/hosts
echo 192.168.1.225 g35 >> /etc/hosts
echo 192.168.1.226 g36 >> /etc/hosts
echo 192.168.1.227 g37 >> /etc/hosts
echo 192.168.1.228 g38 >> /etc/hosts
echo 192.168.1.229 g39 >> /etc/hosts
echo 192.168.1.230 g40 >> /etc/hosts
echo 192.168.1.231 g41 >> /etc/hosts
echo 192.168.1.232 g42 >> /etc/hosts
echo 192.168.1.233 g43 >> /etc/hosts
echo 192.168.1.234 g44 >> /etc/hosts
echo 192.168.1.235 g45 >> /etc/hosts
echo 192.168.1.236 g46 >> /etc/hosts
echo 192.168.1.237 g47 >> /etc/hosts

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
