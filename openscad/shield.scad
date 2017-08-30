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
shieldSPIX=17.1;
shieldSPIY=4.25;

shiledJackWidth=12.00;// jack.jpg
shiledJackLength=14.10;
shiledJackHeight=6.00;// jack.jpg (5 + 1)
shiledJackX=shieldX-shiledJackLength+2.5;// ?
shiledJackY=10.48;

shiledLEDWidth=3.20;// led.pdf
shiledLEDLength=14.90;// ?
shiledLEDHeight=3.20;// led.pdf
shiledLEDX=shieldX-shiledJackLength+2.5;// ?
shiledLEDY=43.06;

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
		translate([shiledJackX+shieldEdgeCut,shiledJackY+shiledJackWidth+1.72,shieldThick])
			cube([shiledJackLength,shiledJackWidth,shiledJackHeight]);
		translate([shiledLEDX+shieldEdgeCut,shiledLEDY,shieldThick+shiledLEDWidth/2])// LED
            rotate([0,90,0]) cylinder(shiledLEDLength,shiledLEDWidth/2,shiledLEDWidth/2);
		translate([shiledLEDX+shieldEdgeCut,shiledLEDY+2.44,shieldThick+shiledLEDWidth/2])
            rotate([0,90,0]) cylinder(shiledLEDLength,shiledLEDWidth/2,shiledLEDWidth/2);

	}
}
