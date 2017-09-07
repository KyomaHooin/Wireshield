//
// RPi Wireshield Case 
//

include <shield.scad>;
include <tft.scad>;
include <rpi.scad>;
include <fc.scad>;

drawPi=0;
drawShiled=0;
drawDisplay=0;
drawCaseTop=0;
drawCaseBottom=0;
drawAll=1;

$fn=50;

//------------------------------

//SPACER

spacerHeight=18.7;

module spacer_mount() {
	spacer(piHoleOffset, piHoleOffset);
	spacer(shieldX-piHoleOffset, piHoleOffset);
	spacer(piHoleOffset, shieldY-piHoleOffset);
	spacer(shieldX-piHoleOffset, shieldY-piHoleOffset);
}

//CASE BOTTOM
//
// -lip lock
// -1mm spacing
// -microSD cut
//

bottomThick=3;
bottomX=56;
bottomY=85;
bottomMountHight=2.26;
bottomMountDia=5;
bottomHeight=bottomThick+bottomMountHight+piThick+microHeight/2;

module case_bottom() {
    color("olive")
    difference() {
        rounded_rect(bottomX, bottomY, bottomHeight, bottomThick);// BASE
        translate([0,0,bottomThick]) cube([bottomX, bottomY, bottomHeight]); // FILLER
        translate([0,0,bottomThick+bottomMountHight]) rpi(edgeCut=3);// RPI
        bottom_hole();// BOTTOM HOLE
        for (vspace=[1:7])// VENT
            translate([piX/4, 10*vspace+2.5, -1]) rounded_rect(bottomX/2, 1, bottomThick+2, 1);
//        translate([0,bottomY+bottomThick/2,bottomThick+bottomMountHight+piThick])// LIPLOCK
//            cube([bottomX,bottomThick/2,bottomThick]);
//        translate([bottomX+bottomThick/2,piHoleOffset,bottomThick+bottomMountHight+piThick])
//            cube([bottomThick/2, 58, bottomThick]);
    }
    bottom_mount(piHoleOffset, piHoleOffset, bottomThick);// BOTTOM MOUNT
	bottom_mount(piX-piHoleOffset,piHoleOffset, bottomThick);
	bottom_mount(piHoleOffset, shieldY-piHoleOffset, bottomThick);
	bottom_mount(piX-piHoleOffset, shieldY-piHoleOffset, bottomThick);

}

//CASE TOP
//
// -Circular jack to jack slot 
// -top-top = topWidth-1
// -IDC lip
// -lip-lock
// -1mm spacing
//

topThick=3;
topX=56;
topY=85;
topDisplayMountHeight=1.26;
topDisplayMountHoleDia=2.5;
topDisplayMountDia=5;
topMountHeight=spacerHeight+displayThick+topDisplayMountHeight;
topMountHoleDia=3.1;
topMountDia=6;
topHeight=spacerHeight-microHeight/2+shieldThick+spacerHeight+displayThick+topDisplayMountHeight+topThick;

displayHoleOffsetX=(piX-displayX)/2+displayHoleX;
displayHoleOffsetY=(piY-displayY)/2+displayHoleY;
displayHoleOffsetXX=(piX-displayX)/2+displayX-displayHoleX;
displayHoleOffsetYY=(piY-displayY)/2+displayY-displayHoleY;

module case_top() {
    difference() {
        rounded_rect(topX, topY, topHeight, topThick);// BASE
        translate([0,0,-topThick]) cube([topX, topY, topHeight]);// FILLER
        translate([0,0,-microHeight/2-piThick]) rpi(edgeCut=3);// RPI
        translate([0,0,spacerHeight-microHeight/2]) shield(shieldEdgeCut=5);// SHILED
        translate([(piX-displayX)/2, (piY-displayY+2*screenOffset)/2, 0])// SCREEN
            cube([displayX,displayY-2*screenOffset,topHeight+1]);
        top_display_hole();// SCREEN HOLE
        translate([displayHoleOffsetX,displayHoleOffsetY,topHeight-1]) top_sink();//SCREEN HOLE SINK
        translate([displayHoleOffsetXX,displayHoleOffsetY,topHeight-1]) top_sink();
        translate([displayHoleOffsetX,displayHoleOffsetYY,topHeight-1]) top_sink();
        translate([displayHoleOffsetXX,displayHoleOffsetYY,topHeight-1]) top_sink();
    }
    //TOP MOUNT
    top_mount(piHoleOffset, piHoleOffset, spacerHeight-microHeight/2+shieldThick);
	top_mount(piX-piHoleOffset,piHoleOffset, spacerHeight-microHeight/2+shieldThick);
	top_mount(piHoleOffset, shieldY-piHoleOffset, spacerHeight-microHeight/2+shieldThick);
	top_mount(piX-piHoleOffset, shieldY-piHoleOffset, spacerHeight-microHeight/2+shieldThick);
    //DISPLAY MOUNT
    top_display_mount(displayHoleOffsetX,displayHoleOffsetY,topHeight-topThick-topDisplayMountHeight);
    top_display_mount(displayHoleOffsetXX,displayHoleOffsetY,topHeight-topThick-topDisplayMountHeight);
    top_display_mount(displayHoleOffsetX,displayHoleOffsetYY,topHeight-topThick-topDisplayMountHeight);
    top_display_mount(displayHoleOffsetXX,displayHoleOffsetYY,topHeight-topThick-topDisplayMountHeight);
}

//------------------------------

if (drawPi) { rpi(); }
if (drawShiled) { shield(); }
if (drawDisplay) { display(); }
if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

if (drawAll) {
    translate([-bottomX/2,-bottomY/2,0]) {// CENTER
        translate([0,0,0]) case_bottom();
        translate([0,0,bottomThick+bottomMountHight]) rpi();
        translate([0,0,bottomThick+bottomMountHight+piThick]) spacer_mount();
        translate([0,0,bottomThick+bottomMountHight+piThick+spacerHeight]) shield();
        translate([(piX-displayX)/2, (piY-displayY)/2,
            bottomThick+bottomMountHight+piThick+spacerHeight+shieldThick+spacerHeight])
            display();
        translate([0,0,bottomHeight]) case_top();
    }
}
