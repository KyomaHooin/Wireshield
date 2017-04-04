//
// RPi Shiled / TFT Display case
//

drawPi=0;
drawShiled=0;
drawDisplay=0;
drawCaseTop=0;
drawCaseBottom=0;

$fn=50;

//----------------------------
// FUNC

module rounded_rect(x, y, z, radius) {
	linear_extrude(height=z)
		minkowski() {
			square([x,y]);
			circle(r = radius);
		}
}

module display_hole() {
	cylinder(h=displayThick+2, d=2*displayHoleRadius);
}

module shield_hole() {
	cylinder(h=shieldThick+2, d=shieldHoleDia);
}

module pi_hole() {
	cylinder(h=piThick+2, d=piHoleDia);
}

//----------------------------
//RPI
//
// MicroUSB,ETH ..

piWidth=56;
piLength=85;
piThick=1.33;
piHoleDia=2.75;
piHoleOffset=3.5;

module pi() {
	color("seagreen")
	difference() {
		cube([piWidth, piLength, piThick]);
		translate([piHoleOffset, piHoleOffset, -1]) pi_hole();
		translate([piWidth-piHoleOffset, piHoleOffset, -1]) pi_hole();
		translate([piHoleOffset, piLength-piHoleOffset, -1]) pi_hole();
		translate([piWidth-piHoleOffset,piLength-piHoleOffset, -1]) pi_hole();
	}
}

//----------------------------
//SHIELD

shieldWidth=56;
shieldLength=65;
shieldThick=1.33;
shieldHoleDia=2.75;
shieldHoleOffset=3.5;

module shield() {
	color("seagreen")
	difference() {
		cube([shieldWidth, shieldLength, shieldThick]);
		translate([shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
	}
	//JACK
	//LED
	//HEADER
	//MEGA
}

//----------------------------
//DISPLAY

displayWidth=42.46;
displayLength=67.2;
screenOffset=5;
displayThick=1.33;
displayHoleRadius=1.7;
displayHoleWoffset=3.5;
displayHoleLoffset=2.5;

module display() {
	color("salmon")
	difference() {
		cube([displayWidth, displayLength, displayThick]);
		translate([displayHoleWoffset, displayHoleLoffset, -1]) display_hole();
		translate([displayWidth-displayHoleWoffset, displayHoleLoffset, -1]) display_hole();
		translate([displayHoleWoffset, displayLength-displayHoleLoffset, -1]) display_hole();
		translate([displayWidth-displayHoleWoffset, displayLength-displayHoleLoffset, -1]) display_hole();
	}
	color("lightblue")//SCREEN
	translate([0,screenOffset,displayThick])
		cube([displayWidth, displayLength-2*screenOffset, displayThick]);
}

//----------------------------
//CASE TOP
//
// TFT, bottom screw cylinder
// pwr,jack,USB side
// liplock


topWidth=piWidth;
topLength=piLength;
topHeight=15-piThick;

module case_top() {
	difference() {
		rounded_rect(topWidth, topLength, topHeight,3);
		translate([(piWidth-displayWidth)/2,(piLength-displayLength)/2+screenOffset,0])
			cube([displayWidth,displayLength-2*screenOffset,topHeight+1]);
		translate([0,0,-piThick])
			cube([piWidth, piLength, topHeight]);
	}
//	// Lock lip extensions
//	translate([-locklipWidth,0,-locklipHeight])
//		cube([locklipWidth, boardLength, locklipHeight]);
//	translate([topWidth,0,-locklipHeight])
//		cube([locklipWidth, boardLength, locklipHeight]);
}


//----------------------------
//CASE BOTTOM
//
// ventilation
// pwr,jack,USB side
// wall harden
// mount
// liplock

bottomWidth=piWidth;
bottomLength=piLength;
bottomHeight=15+piThick;
bottomThick=3;

module case_bottom() {
	difference() {
		rounded_rect(piWidth, piLength, topHeight, 3);
		translate([0,0,piThick])
			cube([piWidth, piLength, topHeight]);
//		translate([-locklipWidth,0,baseHeight-locklipHeight])
//			cube([boardWidth+(locklipWidth*2), boardLength, 5]);
	}
//	difference() {
//		translate([mountHoleSideOffset, boardLength-mountHoleSideOffset, 0])
//			cylinder(h=mountRiserHeight, d=mountHoleDiameter*mountRiserScale);
//		translate([mountHoleSideOffset, boardLength-mountHoleSideOffset, mountRiserHeight/2])
//			cylinder(h=10, d=mountHoleDiameter);
//	}
//		difference() {
//			translate([boardWidth-mountHoleSideOffset, boardLength-mountHoleSideOffset, 0])
//				cylinder(h=mountRiserHeight, d=mountHoleDiameter*mountRiserScale);
//			translate([boardWidth-mountHoleSideOffset, boardLength-mountHoleSideOffset, mountRiserHeight/2])
//				cylinder(h=10, d=mountHoleDiameter);
//		}	
//		difference() {
//			translate([mountHoleSideOffset, mountHoleMidOffset, 0])
//				cylinder(h=mountRiserHeight, d=mountHoleDiameter*mountRiserScale);
//			translate([mountHoleSideOffset, mountHoleMidOffset, mountRiserHeight/2])
//				cylinder(h=10, d=mountHoleDiameter);
//		}	
//		difference() {
//			translate([boardWidth-mountHoleSideOffset, mountHoleMidOffset, 0])
//				cylinder(h=mountRiserHeight, d=mountHoleDiameter*mountRiserScale);		
//			translate([boardWidth-mountHoleSideOffset, mountHoleMidOffset, mountRiserHeight/2])
//				cylinder(h=10, d=mountHoleDiameter);
//		}
}

//----------------------------
// MAIN

if (drawPi) { pi(); }
if (drawShiled) { shield(); }
if (drawDisplay) { display(); }
if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

translate([0,0,0]) pi();
translate([0,0,10]) shield();
translate([(piWidth-displayWidth)/2,(piLength-displayLength)/2,20]) display();
translate([0,0,30]) case_top();
translate([0,0,-20]) case_bottom();

