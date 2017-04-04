//
// RPi Shiled OneWire bus case
//
//BOTTOM
//
// ventilation
// pwr,jack,USB side
// wall harden

drawDisplay=0;
drawShiled=0;
drawPi=0;
drawCaseBottom=0;
drawCaseTop=0;

//----------------------------
// DEFAULT

$fn=50;

boardWidth=56;
boardLength=85;
boardThickness=1.33;
roundedRectRadius=4;

mountRiserHeight=7;
mountRiserScale=2;
locklipWidth=2;
locklipHeight=2;
mountHoleDiameter=2.75;
mountHoleSideOffset=3.5;
mountHoleMidOffset=boardLength-mountHoleSideOffset-58;
baseAndLidSeperationFromZero = baseWidth + (baseWidth / 1.3);

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

//----------------------------
//CASE BOTTOM

baseWidth=boardWidth;
baseLength=boardLength;
baseHeight=mountRiserHeight+boardThickness;
baseThickness=3;

module case_bottom() {
	difference() {
		rounded_rect(baseWidth,baseLength,baseHeight,roundedRectRadius);
		translate([0,0,baseThickness])
			cube([boardWidth, boardLength, baseHeight*2]);
		translate([-locklipWidth,0,baseHeight-locklipHeight])
			cube([boardWidth+(locklipWidth*2), boardLength, 5]);
	}
	difference() {
		translate([mountHoleSideOffset, boardLength-mountHoleSideOffset, 0])
			cylinder(h=mountRiserHeight, d=mountHoleDiameter*mountRiserScale);
		translate([mountHoleSideOffset, boardLength-mountHoleSideOffset, mountRiserHeight/2])
			cylinder(h=10, d=mountHoleDiameter);
	}
		difference() {
			translate([boardWidth-mountHoleSideOffset, boardLength-mountHoleSideOffset, 0])
				cylinder(h=mountRiserHeight, d=mountHoleDiameter*mountRiserScale);
			translate([boardWidth-mountHoleSideOffset, boardLength-mountHoleSideOffset, mountRiserHeight/2])
				cylinder(h=10, d=mountHoleDiameter);
		}	
		difference() {
			translate([mountHoleSideOffset, mountHoleMidOffset, 0])
				cylinder(h=mountRiserHeight, d=mountHoleDiameter*mountRiserScale);
			translate([mountHoleSideOffset, mountHoleMidOffset, mountRiserHeight/2])
				cylinder(h=10, d=mountHoleDiameter);
		}
	
		difference() {
			translate([boardWidth-mountHoleSideOffset, mountHoleMidOffset, 0])
				cylinder(h=mountRiserHeight, d=mountHoleDiameter*mountRiserScale);		
			translate([boardWidth-mountHoleSideOffset, mountHoleMidOffset, mountRiserHeight/2])
				cylinder(h=10, d=mountHoleDiameter);
		}
}

//----------------------------
//CASE TOP

// TFT hole
// TFT, bottom screw cylinder
// pwr,jack,USB side
// wall harden

topWidth=baseWidth;
topLength=baseLength;
topHeight=17.03-boardThickness;

module case_top() {
	difference() {
		rounded_rect(topWidth, topLength, topHeight,roundedRectRadius);
		translate([7,9,0])
		cube([displayWidth,displayLength,topHeight+1]);
		translate([0,0,-baseThickness])
			cube([boardWidth, boardLength, topHeight]);
	}
//	// Lock lip extensions
	translate([-locklipWidth,0,-locklipHeight])
		cube([locklipWidth, boardLength, locklipHeight]);
	translate([topWidth,0,-locklipHeight])
		cube([locklipWidth, boardLength, locklipHeight]);
}

//----------------------------
//SHIELD

shieldWidth=56;
shieldLength=65;
shieldThick=1.33;
shieldRad=3;
shieldHoleDia=2.75;
shieldHoleOffset=0.4;

module shield() {
	color("seagreen")
	difference() {
		rounded_rect(shieldWidth, shieldLength, shieldThick, shieldRad);
		translate([shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset, shieldHoleOffset, -1]) shield_hole();
		translate([shieldHoleOffset, shieldLength-shieldHoleOffset, -1]) shield_hole();
		translate([shieldWidth-shieldHoleOffset,shieldLength-shieldHoleOffset, -1]) shield_hole();
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

// MAIN

if (drawDisplay) { display(); }
if (drawShiled) { shield(); }
if (drawPi) { pi(); }
if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

translate([0,0,0]) case_bottom();
translate([0,18,0])
	translate([0,0,15]) shield();
translate([7,9,0])
	translate([0,0,25]) display();
translate([0,0,40]) case_top();

