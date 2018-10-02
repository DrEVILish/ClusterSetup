apt update && apt upgrade -y

apt install -y \
  automake autoconf apt-transport-https \
  ca-certificates cpufrequtils curl \
  git golang-go \
  htop \
  libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev \
  pkg-config \
  software-properties-common screen sysfsutils \
  xfsprogs 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
add-apt-repository ppa:gluster/libntirpc-1.7 -y
add-apt-repository ppa:gluster/glusterfs-4.1 -y
add-apt-repository ppa:gluster/glusterd2-4.1 -y

apt update
apt install -y docker-ce glusterd2-* glusterfs-* libntirpc*
apt upgrade -y
apt autoremove -y

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
