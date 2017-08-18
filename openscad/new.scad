//
// RPi Shiled / display display case
//

drawPi=0;
drawShiled=0;
drawDisplay=0;
drawCaseTop=0;
drawCaseBottom=0;
drawAll=1;

$fn=50;

include <shield.scad>;
include <tft.scad>;
include <rpi.scad>;

//------------------------------------------

if (drawPi) { rpi(); }
if (drawShiled) { shield(); }
if (drawDisplay) { display(); }
//if (drawCaseTop) { case_top(); }
//if (drawCaseBottom) { case_bottom(); }

if (drawAll) {
//	translate([0,0,0])
//		case_bottom();
//	translate([0,0,bottomThick+bottomMountHight])
	translate([0,0,0]) rpi();
//	translate([0,0,bottomThick+bottomMountHight+piThick])
//		spacer_mount();
//	translate([0,0,bottomThick+bottomMountHight+piThick+spacerHeight])
	translate([0,0,15]) shield();
//	translate([0,0,bottomThick+bottomMountHight+piThick+spacerHeight+shieldThick++spacerHeight])
	translate([0,0,30]) display() ;
//	translate([0,0,bottomThick+bottomMountHight+piThick+shieldThick+displayThick+topThick])
//        case_top();
}