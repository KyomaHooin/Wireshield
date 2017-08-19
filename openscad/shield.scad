//
// RPI Shiled - Shield
//

shieldX=56;// RPi.png
shieldY=65;// RPi.png
shieldThick=1.5;// plosnaky.cz
shieldHoleDia=2.75;// RPi.png
shieldHoleXY=3.5;// RPi.png

shieldSPIWidth=2.54;// pls.jpg
shieldSPILength=9*2.54;// pls.jpg
shieldSPIHeight=6.10+2.5;// pls.jpg
shieldSPIX=(shieldX-shieldSPILength)/2;// ?
shieldSPIY=2.5;// ?

shiledJackWidth=12.00;// jack.jpg
shiledJackLength=13.70;// jack.jpg
shiledJackHeight=6.00;// jack.jpg (5 + 1)
shiledJackX=shieldX-shiledJackLength+2.5;// ?
shiledJackY=25;// ?

shiledLEDWidth=3.20;// led.pdf
shiledLEDLength=14.90;// ?
shiledLEDHeight=3.20;// led.pdf
shiledLEDX=shieldX-shiledJackLength+2.5;// ?
shiledLEDY=40;// ?

shieldGPIOWidth=2*2.54;// pls.jpg
shieldGPIOLength=20*2.54;// pls.jpg
shieldGPIOHeight=6.10+2.5;// pls.jpg
shieldGPIOX=1.05;// ?
shieldGPIOY=(shieldY-shieldGPIOLength)/2;// ?

$fn=50;

module shield_hole() {
	cylinder(h=shieldThick+2, d=shieldHoleDia);
}

module shield(shieldEdgeCut=0) {
	color("seagreen")
	difference() {
		cube([shieldX, shieldY, shieldThick]);
		translate([shieldHoleXY, shieldHoleXY, -1]) shield_hole();
		translate([shieldX-shieldHoleXY, shieldHoleXY, -1]) shield_hole();
		translate([shieldHoleXY, shieldY-shieldHoleXY, -1]) shield_hole();
		translate([shieldX-shieldHoleXY, shieldY-shieldHoleXY, -1]) shield_hole();
	}
	color("black") {
		translate([shieldGPIOX, shieldGPIOY, shieldThick])// GPIO
			cube([shieldGPIOWidth, shieldGPIOLength, shieldGPIOHeight]);
		translate([shieldSPIX,shieldSPIY,shieldThick])// SPI
			cube([shieldSPILength,shieldSPIWidth,shieldSPIHeight]);
		translate([shiledJackX+shieldEdgeCut,shiledJackY,shieldThick])// JACK
			cube([shiledJackLength,shiledJackWidth,shiledJackHeight]);
		translate([shiledJackX+shieldEdgeCut,shiledJackY-15,shieldThick])
			cube([shiledJackLength,shiledJackWidth,shiledJackHeight]);
		translate([shiledLEDX+shieldEdgeCut,shiledLEDY,shieldThick])// LED
			cube([shiledLEDLength,shiledLEDWidth,shiledLEDHeight]);
		translate([shiledLEDX+shieldEdgeCut,shiledLEDY+5,shieldThick])
			cube([shiledLEDLength,shiledLEDWidth,shiledLEDHeight]);
	}
}
