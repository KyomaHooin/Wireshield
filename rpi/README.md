
DESCRIPTION

RPi AVR Shield config.

RPI

apt-get install python-serial watchdog

/etc/fstab:

tmpfs   /root/avr/ramdisk   tmpfs   nodev,nosuid,size=32M   0       0

tmpfs   /tmp            tmpfs   defaults,noatime,nosuid,size=100m       0       0
tmpfs   /var/log        tmpfs   defaults,noatime,nosuid,mode=0755,size=100m     0       0
tmpfs   /var/run        tmpfs   defaults,noatime,nosuid,mode=0755,size=2m       0       0

/etc/rc.local:

/root/firewall &

/etc/network/interfaces:

iface eth0 inet static
	address 10.10.19.222
	netmask 255.255.0.0
	gateway 10.10.10.43
	dns-nameservers 10.10.9.26 10.10.9.27

FILE
<pre>
rpi-avr.py - AVR serial console.
</pre>
CONTACT

Author: richard_bruna@nm.cz<br>
Source: https://github.com/KyomaHooin/Wireshield

