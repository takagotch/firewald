systemctl start firewald
systemctl enable firewald
firewald-cmd --list-all-zones

firewall-cmd --state
firewall-cmd --get-zones
firewall-cmd --get-active-zones

yum install -y nfs-utils
systemctl start nfs-server
systemctl status nfs-server

vi /etc/export
systemctl reload nfs-server
exportfs -av

showmount -e localhost
systemctl enable nfs-server
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --reload
firewall-cmd --zone=public --list-services
firewall-cmd --list-all

cat /etc/firewalld/zones/public.xml
mount -t nfs 172.16.70.1:/home/ /mnt/
df -HT | grep nfs
firewall-cmd --permanent --zone=public --remove-service=nfs
firewall-cmd --reload

vi /etc/sysctl.conf
syscl -p
cat /proc/sys/net/ipv4/ip_forwad
firewall-cmd --get-active-zones
firewall-cmd --permanent --zone=trusted --change-interface=ens7
firewall-cmd --get-active-zones
firewall-cmd --permanent -zone=public --add-masquerade
firewall-cmd --reload

firewall-cmd --list-all --zone=public
firewall-cmd --list-all --zone=trusted

cd /etc/firewalld/zones/
cat public.xml
cat trusted.xml

vi /etc/grub.d/40_custom
grub2-mkconfig -o /boot/grub2/grub.cfg
reboot

vi /etc/grub.d/40_custom
grub2-mkconfig -o /boot/grub2/grub.cfg
reboot
cat /etc/grub.d/40_custom
grep ^CLASS= /etc/grub.d/10_linux

cp /etc/grub.d/10_linux /root/10_linux.org
vi /etc/grub.d/10_linux

grub2-mkconfig -o /boot/grub2/grub.cfg
reboot

cat /etc/grub.d/40_custom

cp /etc/grub.d/40_custom /root/40_custom.org
grub2-mkpasswd-pbkdf2
vi /etc/grub.d/40_custom
grub2-mkconfig -o /boot/grub2/grub.cfg
reboot

yum install -y system-storage-manager
ssm list
df -HT
echo "Hello encrypted LVM" > /mnt/testfile
umount /mnt
cryptsetup luksClose /dev/mapper/encrypted001
ssm list volumes
cryptesetup luksOpen /dev/mapper/pool001-lvol001 encrypted001
ssm list volumes
mount /dev/mapper/encrypted001 /mnt


