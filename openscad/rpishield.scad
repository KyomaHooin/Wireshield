//
// RPi Shiled case
//

drawPi=0;
drawShiled=0;
drawDisplay=0;
drawCaseTop=0;
drawCaseBottom=1;
drawAll=0;

$fn=50;

include <func.scad>
include <shield.scad>;
include <tft.scad>;
include <rpi.scad>;

// SPACER

spacerHeight=15;

module spacer_mount() {
	spacer(piHoleOffset, piHoleOffset);
	spacer(shieldX-piHoleOffset, piHoleOffset);
	spacer(piHoleOffset, shieldY-piHoleOffset);
	spacer(shieldX-piHoleOffset, shieldY-piHoleOffset);
}

//CASE BOTTOM
//
// ventilation
// liplock

bottomX=56;// RPi.png
bottomY=85;// RPi.png
bottomHeight=15+1.60;// ?
bottomThick=3;// ?
bottomMountHight=2;// ?
bottomMountDia=6.2;// ?

module case_bottom() {
	difference() {
		rounded_rect(bottomX, bottomY, bottomHeight, bottomThick);
		translate([0,0,bottomThick]) cube([bottomX, bottomY, bottomHeight]); // FILLER
		translate([piHoleOffset, piHoleOffset,-1]) bottom_hole();// MOUNT HOLE
		translate([bottomX-piHoleOffset, piHoleOffset,-1]) bottom_hole();
		translate([piHoleOffset,shieldY-piHoleOffset,-1]) bottom_hole();
        translate([bottomX-piHoleOffset,shieldY-piHoleOffset,-1]) bottom_hole();
		translate([0,0,bottomThick+bottomMountHight]) rpi(edgeCut=3); // RPI
	}
	//BUFFER RING
	bottom_mount(piHoleOffset, piHoleOffset, bottomThick);
	bottom_mount(bottomX-piHoleOffset,piHoleOffset, bottomThick);
	bottom_mount(piHoleOffset, shieldY-piHoleOffset, bottomThick);
	bottom_mount(bottomX-piHoleOffset, shieldY-piHoleOffset, bottomThick);
}

//CASE TOP
//
// display, bottom screw cylinder
// pwr,jack,USB side
// liplock

//topWidth=piWidth;
//topLength=piLength;
//topHeight=30-piThick;
//topThick=3;
//topMountHight=2;
//topMountPiHight=topHeight;
//topMountHoleDia=2;
//topMountDia=6.2;

//module case_top() {
//	difference() {
//		rounded_rect(topWidth, topLength, topHeight, topThick);
//		translate([0,0,-topThick]) cube([piWidth, piLength, topHeight]);// filler
//		translate([displayOffsetW, displayOffsetH+screenOffset, 0])// screen
//			cube([displayWidth,displayLength-2*screenOffset,topHeight+1]);
//		translate([displayOffsetW+displayHoleWoffset,displayOffsetH+displayHoleLoffset,topHeight-topThick-1])// display hole
//			cylinder(h=topThick+2,r=displayHoleRadius);
//		translate([displayWidth+displayHoleWoffset, displayOffsetH+displayHoleLoffset, topHeight-topThick-1])
//			cylinder(h=topThick+2,r=displayHoleRadius);
//		translate([displayOffsetW+displayHoleWoffset, topLength-displayOffsetH-displayHoleLoffset, topHeight-topThick-1])
//			cylinder(h=topThick+2,r=displayHoleRadius);
//		translate([displayWidth+displayHoleWoffset, topLength-displayOffsetH-displayHoleLoffset, topHeight-topThick-1])
//			cylinder(h=topThick+2,r=displayHoleRadius);
//		translate([0,0,-10]) pi(edgeCut=3);
//		translate([0,0,10]) shield(shieldEdgeCut=3);
//	}
//}

//------------------------------------------

if (drawPi) { rpi(); }
if (drawShiled) { shield(); }
if (drawDisplay) { display(); }
//if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

if (drawAll) {
	translate([0,0,0]) case_bottom();
	translate([0,0,bottomThick+bottomMountHight])
        rpi();
	translate([0,0,bottomThick+bottomMountHight+piThick])
        spacer_mount();
	translate([0,0,bottomThick+bottomMountHight+piThick+spacerHeight])
        shield();
	translate([(piX-displayX)/2, (piY-displayY)/2,
        bottomThick+bottomMountHight+piThick+spacerHeight+shieldThick+spacerHeight
    ]) display() ;
//	translate([0,0,bottomThick+bottomMountHight+piThick+shieldThick+displayThick+topThick])
//        case_top();
}