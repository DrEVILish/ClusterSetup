
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
