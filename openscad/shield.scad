//
// RPI Shield - Shield
//

include<fc.scad>;

shieldX=56;// RPi.png
shieldY=65;// RPi.png
shieldThick=1.5;// plosnaky.cz
shieldHoleDia=2.75;// RPi.png
shieldHoleXY=3.5;// RPi.png

shieldSPIWidth=2.54;// pls.jpg
shieldSPILength=9*2.54;// pls.jpg
shieldSPIHeight=6.10+2.5;// pls.jpg
shieldSPIX=16.49;
shieldSPIY=4.56;

shieldJackWidth=12.00;// jack.jpg
shieldJackLength=14.10;
shieldJackHeight=6.00;// jack.jpg (5 + 1)
shieldJackX=shieldX-shieldJackLength+3.56;
shieldJackY=10.56;

shieldLEDDia=4.20;// led.pdf
shieldLEDLength=13.72;
shieldLEDX=47;
shieldLEDY=43.1;

shieldGPIOWidth=2*2.54;// pls.jpg
shieldGPIOLength=20*2.54;// pls.jpg
shieldGPIOHeight=6.10+2.5;// pls.jpg
shieldGPIOX=2.16;
shieldGPIOY=(shieldY-shieldGPIOLength)/2;

module shield_hole() {
    cylinder(h=shieldThick+2, d=shieldHoleDia);
}

module shield(shieldEdgeCut=0) {
    color("seagreen")
    difference() {
        translate([2, 2, 0]) rounded_rect(shieldX-4, shieldY-4, shieldThick, 2);
        translate([shieldHoleXY, shieldHoleXY, -1]) shield_hole();
        translate([shieldX-shieldHoleXY, shieldHoleXY, -1]) shield_hole();
        translate([shieldHoleXY, shieldY-shieldHoleXY, -1]) shield_hole();
        translate([shieldX-shieldHoleXY, shieldY-shieldHoleXY, -1]) shield_hole();
    }
    color("black") {
        translate([shieldGPIOX, shieldGPIOY, shieldThick])// GPIO
            cube([shieldGPIOWidth, shieldGPIOLength, shieldGPIOHeight]);
        translate([shieldSPIX, shieldSPIY, shieldThick])// SPI
            cube([shieldSPILength, shieldSPIWidth, shieldSPIHeight]);
        translate([shieldJackX+shieldEdgeCut, shieldJackY, shieldThick])// JACK
            cube([shieldJackLength, shieldJackWidth, shieldJackHeight]);
        translate([shieldJackX+shieldEdgeCut, shieldJackY+shieldJackWidth+2.37, shieldThick])
            cube([shieldJackLength, shieldJackWidth, shieldJackHeight]);
        translate([shieldLEDX+shieldEdgeCut, shieldLEDY+shieldLEDDia/2-0.5, shieldThick+shieldLEDDia/2])// LED
            rotate([0,90,0]) cylinder(shieldLEDLength, shieldLEDDia/2, shieldLEDDia/2);
        translate([shieldLEDX+shieldEdgeCut, shieldLEDY+3*shieldLEDDia/2+2.35-0.5, shieldThick+shieldLEDDia/2])
            rotate([0,90,0]) cylinder(shieldLEDLength, shieldLEDDia/2, shieldLEDDia/2);
    }
}

shield();
