//
// RPi Wireshield Case 
//

include <shield.scad>;
include <tft.scad>;
include <rpi.scad>;
include <fc.scad>;

drawCaseTop=0;
drawCaseBottom=0;
drawSpacer=0;
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
bottomMountDia=5.5;
bottomHeight=bottomThick+bottomMountHeight+piThick+microHeight/2;

module case_bottom() {
    difference() {
        translate([-0.5,-0.5,0]) rounded_rect(bottomX+1, bottomY+1, bottomHeight+1, bottomThick);// BASE
        translate([-0.5,-0.5,bottomThick]) cube([bottomX+1, bottomY+1, bottomHeight]); // FILLER
        translate([0,0,bottomThick+bottomMountHeight]) rpi(edgeCut=3);// RPI
        bottom_hole();// BOTTOM HOLE
        for (vspace=[1:7])// VENT
            translate([piX/4, 10*vspace+2.5, -1]) rounded_rect(bottomX/2, 1, bottomThick+2, 1);
        translate([cardX, -bottomThick-0.5, bottomThick+bottomMountHeight]) sd_lip();// SD LIP
        translate([usb2X-1,bottomY+bottomThick/2+0.5,bottomThick+bottomMountHeight+piThick-0.5]) usb_lip();// USB LIP
        translate([bottomX+bottomThick/2+0.5,microY-1-0.5,bottomThick+bottomMountHeight+piThick-0.5])// MICRO LIP
            micro_lip();
        translate([-0.5,-0.5,bottomHeight]) lip_lock_bottom();// LIPLOCK
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
topMountHoleDia=3.1;
topMountDia=6;
topHeight=spacerHeight-microHeight/2+shieldThick+spacerHeight+displayThick+topDisplayMountHeight+topThick;

displayHoleOffsetX=(piX-displayX)/2+displayHoleX;
displayHoleOffsetY=(piY-displayY)/2+displayHoleY;
displayHoleOffsetXX=(piX-displayX)/2+displayX-displayHoleX;
displayHoleOffsetYY=(piY-displayY)/2+displayY-displayHoleY;

module case_top() {
    difference() {
        translate([-0.5,-0.5,0]) rounded_rect(topX+1, topY+1, topHeight, topThick);// BASE
        translate([-0.5,-0.5,-topThick]) cube([topX+1, topY+1, topHeight]);// FILLER
        translate([0,0,-microHeight/2-piThick]) rpi(edgeCut=3);// RPI
        translate([0,0,spacerHeight-microHeight/2]) shield(shieldEdgeCut=5);// SHILED
        translate([(piX-displayX)/2+0.5, (piY-displayY)/2+5.82, 0])// SCREEN
            cube([displayX-1, screenLength, topHeight+1]);
        top_display_hole();// SCREEN HOLE
        translate([displayHoleOffsetX,displayHoleOffsetY,topHeight-1.5]) top_sink();// SCREEN HOLE SINK
        translate([displayHoleOffsetXX,displayHoleOffsetY,topHeight-1.5]) top_sink();
        translate([displayHoleOffsetX,displayHoleOffsetYY,topHeight-1.5]) top_sink();
        translate([displayHoleOffsetXX,displayHoleOffsetYY,topHeight-1.5]) top_sink();
        translate([-topThick/2-0.5,shieldGPIOY,0])// IDC LIP
            cube([topThick/2,shieldGPIOLength,topHeight-topThick]);
        translate([usb2X-1, topY+bottomThick/2+0.5, -microHeight/2-0.5]) usb_lip();// USB LIP
        translate([bottomX+bottomThick/2+0.5, microY-1-0.5, -microHeight/2-0.5]) micro_lip();// MICRO LIP
        translate([-0.5,-0.5,0]) lip_lock_top();//LIP LOCK
        translate([topX-10,topY-7,spacerHeight-microHeight/2+shieldThick+4-1.5]) button();// PWR/RST 4 = dia/2        
    }
    //TOP MOUNT
    top_mount(piHoleOffset, piHoleOffset, spacerHeight-microHeight/2+shieldThick);
    top_mount_low(piX-piHoleOffset,piHoleOffset, spacerHeight-microHeight/2+shieldThick+0.5);
    top_mount(piHoleOffset, shieldY-piHoleOffset, spacerHeight-microHeight/2+shieldThick);
    top_mount_low(piX-piHoleOffset, shieldY-piHoleOffset, spacerHeight-microHeight/2+shieldThick+0.5);
    //DISPLAY MOUNT
    top_display_mount(displayHoleOffsetX,displayHoleOffsetY,topHeight-topThick-topDisplayMountHeight);
    top_display_mount(displayHoleOffsetXX,displayHoleOffsetY,topHeight-topThick-topDisplayMountHeight);
    top_display_mount(displayHoleOffsetX,displayHoleOffsetYY,topHeight-topThick-topDisplayMountHeight);
    top_display_mount(displayHoleOffsetXX,displayHoleOffsetYY,topHeight-topThick-topDisplayMountHeight);
    //HARDEN
    translate([-1, piHoleOffset-topThick/2, spacerHeight-microHeight/2+shieldThick]) harden();
    translate([piX-topThick/2, piHoleOffset-topThick/2, spacerHeight-microHeight/2+shieldThick+0.5]) harden_low();
    translate([-1, shieldY-piHoleOffset-topThick/2, spacerHeight-microHeight/2+shieldThick]) harden();
    translate([piX-topThick/2, shieldY-piHoleOffset-topThick/2, spacerHeight-microHeight/2+shieldThick+0.5]) harden_low();
    translate([piHoleOffset-topThick/2, -topThick/2, spacerHeight-microHeight/2+shieldThick]) harden();
    translate([piX-piHoleOffset-topThick/2, -topThick/2, spacerHeight-microHeight/2+shieldThick+0.5]) harden_low();
}

//------------------------------

if (drawCaseTop) {
    translate([topX+topThick+0.5, topThick+0.5, topHeight])
        rotate([0,180,0]) case_top();
}

if (drawCaseBottom) {
    translate([topThick+0.5, topThick+0.5, 0]) case_bottom();
}

if(drawSpacer) { spacer_mount(); }

if (drawAll) {
    translate([0,0,0]) case_bottom();
    translate([0,0,bottomThick+bottomMountHeight]) rpi();
    translate([0,0,bottomThick+bottomMountHeight+piThick]) spacer_mount();
    translate([0,0,bottomThick+bottomMountHeight+piThick+spacerHeight]) shield();
    translate([topX-10,topY-7,bottomThick+bottomMountHeight+piThick+spacerHeight+shieldThick+4-1.5]) button();
    translate([(piX-displayX)/2, (piY-displayY)/2,
        bottomHeight+topHeight-topThick-topDisplayMountHeight-displayThick])
        display();
    translate([0,0,bottomHeight]) case_top();
}

