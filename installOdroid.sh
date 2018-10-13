apt update && apt upgrade -y
curl -sSL https://get.docker.com/ | sh

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

mkdir -p /etc/glusterfs
mkdir -p /var/lib/glusterd
mkdir -p /var/log/glusterfs


(
echo g 
echo n 
echo   
echo   
echo   
echo w 
) | fdisk /dev/sda

mkfs.xfs -i size=512 /dev/sda1
mkdir /brickA -p
echo '# Mount /dev/sda1 so that it can be used as a glusterfs volume' >> /etc/fstab
echo '/dev/sda1 /brickA xfs defaults 1 2' >> /etc/fstab
mount -a && mount

mkdir /brickA/brick01
