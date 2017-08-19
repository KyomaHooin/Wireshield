//
//RPI Shiled - RPi
//

piX=56;// RPi.png
piY=85;// RPi.png
piThick=1.60;// ?
piHoleDia=2.75;// RPi.png
piShieldLength=65;// RPi.png
piHoleOffset=3.5;// RPi.png

usbWidth=13.28;
usbLength=17.05;
usbHeight=17.03-piThick;
usb1X=piX-29-usbWidth/2;// RPi.png
usb2X=piX-47-usbWidth/2;// RPi.png
usbOverHang=2;

ethWidth=15.96;
ethLength=21.33;
ethHeight=15.00-piThick;
ethX=piX-10.25-(ethWidth/2);// RPi.png
ethOverHang=2.32;

avWidth=7.05;
avLength=14.90;
avHeight=7.38-piThick;
avOverHang=2.30;
avY=53.5-avWidth/2;// RPi.png

hdmiWidth=11.37;
hdmiLength=15.07;
hdmiHeight=7.86-piThick;
hdmiOverHang=1.9;
hdmiY=32-(hdmiWidth/2);// RPi.png

microWidth=5.59;
microLength=8.04;
microHeight=4.22-piThick;
microOverHang=1.9;
microY=10.6-(microWidth/2);// RPi.png

gpioWidth=2.54*2;// pls.jpg
gpioLength=20*2.54;// pls.jpg
gpioHeight=6.10+2.5;// pls.jpg
gpioX=1.05;// ?
gpioY=piHoleOffset+29-gpioLength/2;// RPi.png

$fn=50;

module pi_hole() {
	cylinder(h=piThick+2, d=piHoleDia);
}

module rpi(edgeCut=0) {
	color("seagreen")
	difference() {
		cube([piX, piY, piThick]);
		translate([piHoleOffset, piHoleOffset, -1]) pi_hole();
		translate([piX-piHoleOffset, piHoleOffset, -1]) pi_hole();
		translate([piHoleOffset, piShieldLength-piHoleOffset, -1]) pi_hole();
		translate([piX-piHoleOffset, piShieldLength-piHoleOffset, -1]) pi_hole();
	}
	color("Silver") {
		// USB
		translate([usb1X, piY-usbLength+usbOverHang+edgeCut, piThick])
			cube([usbWidth, usbLength, usbHeight]);
		translate([usb2X, piY-usbLength+usbOverHang+edgeCut, piThick])
			cube([usbWidth, usbLength, usbHeight]);
		// ETH
		translate([ethX, piY-ethLength+ethOverHang+edgeCut, piThick])
			cube([ethWidth, ethLength, ethHeight]);
		// HDMI Plug
		translate([piX-hdmiWidth+hdmiOverHang+edgeCut, hdmiY, piThick])
			cube([hdmiWidth, hdmiLength, hdmiHeight]);
		// AV
		translate([piX-avLength+avOverHang+edgeCut, avY, piThick])
			cube([avLength, avWidth, avHeight]);
		// microUSB
		translate([piX-microWidth+microOverHang+edgeCut, microY, piThick])
			cube([microWidth, microLength, microHeight]);
	}
	// GPIO Headers
	color("black") {
		translate([gpioX, gpioY, piThick])
			cube([gpioWidth, gpioLength, gpioHeight]);
	}
}
