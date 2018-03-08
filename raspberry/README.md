![RPI](https://github.com/KyomaHooin/Wireshield/raw/master/raspberry/rpi_screen.png "screenshot")

DESCRIPTION

RPi2 AVR shield server configuration.

INSTALL
<pre>
apt-get install apache2 python-serial python-rrdtool watchdog

raspi-config > Interfacing Options > Serial > logging [no] > device [yes]

systemctl disable serial-getty@ttyAMA0.service

/etc/rc.local:

/root/avr/rpi-avr.py &
/root/avr/rstpwr.py &
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

    rpi-avr.py - AVR data processing.
     rstpwr.py - Reset/halt detection.
   database.py - Create RRD database.
      firewall - Firewall script.
rpi_screen.png - Plot output.
</pre>
CONTACT

Author: richard.bruna@protonmail.com<br>
Source: https://github.com/KyomaHooin/Wireshield

