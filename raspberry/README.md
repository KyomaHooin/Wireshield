![RPI](https://github.com/KyomaHooin/Wireshield/raw/master/raspberry/rpi_screen.png "screenshot")

DESCRIPTION

RPi AVR Shield server configuration.

INSTALL
<pre>
apt-get install apache2 python-serial python-rrdtool watchdog

raspi-config > Advanced options > logging [no] > device [yes]

/etc/fstab:

#tmpfs   /root/avr/ramdisk   tmpfs   nodev,nosuid,size=32M   0       0
#tmpfs   /tmp            tmpfs   defaults,noatime,nosuid,size=100m       0       0
#tmpfs   /var/log        tmpfs   defaults,noatime,nosuid,mode=0755,size=100m     0       0
#tmpfs   /var/run        tmpfs   defaults,noatime,nosuid,mode=0755,size=2m       0       0

/etc/rc.local:

/root/avr/rpi-avr.py &
/root/firewall &

/etc/network/interfaces:

auto eth0
iface eth0 inet static
	address 10.10.19.222
	netmask 255.255.0.0
	gateway 10.10.10.43
	dns-nameservers 10.10.9.26 10.10.9.27

/etc/watchdog.conf:

watchdog-device = /dev/watchdog
watchdog-timeout = 15

/etc/ntp.conf:

server tik.cesnet.cz
server tak.cesnet.cz

/etc/apache2/sites-enabled/000-default.conf:

ServerName xxx.xx.cz

DocumentRoot /var/www/rpishield

&lt;Directory /var/www/rpishield/plot&gt;
Options -Indexes -Multiviews
Order Allow,Deny
Allow from all
&lt;/Directory&gt;
</pre>
FILE
<pre>
     frontend/ - HTML frontend.

    rpi-avr.py - AVR  data processing.
   database.py - Create RRD database.
      debug.py - Serial debugging.
      firewall - Firewall script.
rpi_screen.png - Plot output.
</pre>
CONTACT

Author: richard_bruna@nm.cz<br>
Source: https://github.com/KyomaHooin/Wireshield

