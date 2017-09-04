//
//RPI Shiled - TFT display
//

displayX=42.46;// TFT.jpg
displayY=67.20;// TFT.jpg
displayThick=1.6;
displayHoleRadius=1.70;// TFT.jpg
displayHoleX=3.50;// TFT.jpg
displayHoleY=2.50;// TFT.jpg
screenX=40.02;
screenOffset=6.43;
screenThick = 4.6 - displayThick;
displaySPIWidth=2.54;// pls.jpg
displaySPILength=11*2.54;// pls.jpg
displaySPIHeight=6.10+2.5;// pls.jpg
displaySPIX=(displayX-displaySPILength)/2;
displaySPIY=displayY-2.5-displaySPIWidth/2;// TFT.jpg

$fn=50;

module display_hole() {
    cylinder(h=displayThick+2, r=displayHoleRadius);
}

module display() {
	color("salmon")
		difference() {// HOLE
			cube([displayX, displayY, displayThick]);
			translate([displayHoleX, displayHoleY, -1]) display_hole();
			translate([displayX-displayHoleX, displayHoleY, -1]) display_hole();
			translate([displayHoleX, displayY-displayHoleY, -1]) display_hole();
			translate([displayX-displayHoleX, displayY-displayHoleY, -1]) display_hole();
		}
	color("lightblue") { // SCREEN
		translate([0,screenOffset, displayThick])
            cube([displayX, displayY-2*screenOffset, screenThick]);
	}
	color("black") { // SPI
		translate([displaySPIX, displaySPIY, -displaySPIHeight])
            cube([displaySPILength, displaySPIWidth, displaySPIHeight]);
	}
}
