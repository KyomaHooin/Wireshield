//
// RPi Wireshield Case 
//

include <shield.scad>;
include <tft.scad>;
include <rpi.scad>;
include <fc.scad>;

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

bottomThick=2;
bottomX=56;
bottomY=85;
bottomMountHeight=2.26;
bottomMountDia=5;
bottomHeight=bottomThick+bottomMountHeight+piThick+microHeight/2;

module case_bottom() {
    difference() {
        rounded_rect(bottomX, bottomY, bottomHeight, bottomThick);// BASE
        translate([0,0,bottomThick]) cube([bottomX, bottomY, bottomHeight]); // FILLER
        translate([0,0,bottomThick+bottomMountHeight]) rpi(edgeCut=3);// RPI
        bottom_hole();// BOTTOM HOLE
        for (vspace=[1:7])// VENT
            translate([piX/4, 10*vspace+2.5, -1]) rounded_rect(bottomX/2, 1, bottomThick+2, 1);
        translate([cardX, -bottomThick, bottomThick+bottomMountHeight]) sd_lip();// SD LIP
        translate([usb2X-1,bottomY+bottomThick/2,bottomThick+bottomMountHeight+piThick]) usb_lip();// USB LIP
        translate([bottomX+bottomThick/2,microY-1,bottomThick+bottomMountHeight+piThick])// MICRO LIP
            micro_lip();
    }
    bottom_mount(piHoleOffset, piHoleOffset, bottomThick);// BOTTOM MOUNT
	bottom_mount(piX-piHoleOffset,piHoleOffset, bottomThick);
	bottom_mount(piHoleOffset, shieldY-piHoleOffset, bottomThick);
	bottom_mount(piX-piHoleOffset, shieldY-piHoleOffset, bottomThick);

}

//CASE TOP

topThick=2;
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
        translate([displayHoleOffsetX,displayHoleOffsetY,topHeight-1]) top_sink();// SCREEN HOLE SINK
        translate([displayHoleOffsetXX,displayHoleOffsetY,topHeight-1]) top_sink();
        translate([displayHoleOffsetX,displayHoleOffsetYY,topHeight-1]) top_sink();
        translate([displayHoleOffsetXX,displayHoleOffsetYY,topHeight-1]) top_sink();
        translate([-topThick/2,shieldGPIOY,0])// IDC LIP
            cube([topThick/2,shieldGPIOLength,topHeight-topThick]);
        translate([usb2X-1, topY+bottomThick/2, -microHeight/2]) usb_lip();// RPI LIP
        translate([bottomX+bottomThick/2, microY-1, -microHeight/2]) micro_lip();
        translate([bottomX+bottomThick/2, shieldJackY-1, spacerHeight-microHeight/2+shieldThick])// SHIELD LIP
            shield_lip();
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

if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

if (drawAll) {
    translate([-bottomX/2,-bottomY/2,0]) {// CENTER
        translate([0,0,0]) case_bottom();
//        translate([0,0,bottomThick+bottomMountHeight]) rpi();
//        translate([0,0,bottomThick+bottomMountHeight+piThick]) spacer_mount();
//        translate([0,0,bottomThick+bottomMountHeight+piThick+spacerHeight]) shield();
//        translate([(piX-displayX)/2, (piY-displayY)/2,
//            bottomThick+bottomMountHeight+piThick+spacerHeight+shieldThick+spacerHeight])
//            display();
        translate([0,0,bottomHeight]) case_top();
    }
}
