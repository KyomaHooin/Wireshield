//
// RPi Shiled case
//
// boss diameter = 2.5 * screw diamater:
//
// http://www.toray.jp/plastics/en/torelina/technical/tec_027.html
//


include <func.scad>
include <shield.scad>;
include <tft.scad>;
include <rpi.scad>;

drawPi=0;
drawShiled=0;
drawDisplay=0;
drawCaseTop=0;
drawCaseBottom=0;
drawAll=1;

//--------------------------------

$fn=50;

// SPACER

spacerHeight=20;

//module spacer_mount() {
//	spacer(piHoleOffset, piHoleOffset);
//	spacer(shieldX-piHoleOffset, piHoleOffset);
//	spacer(piHoleOffset, shieldY-piHoleOffset);
//	spacer(shieldX-piHoleOffset, shieldY-piHoleOffset);
//}

//CASE BOTTOM

bottomThick=3;
bottomX=56+2;// RPi.png
bottomY=85+2;// RPi.png
bottomMountHight=2.19;
bottomHeight=bottomThick+bottomMountHight+piThick+microHeight-0.1;//hdmi bug
bottomMountDia=5;// ?

idcLength=20*2.54;//+4.57 idc.jpg
idcY=piHoleOffset+(58-idcLength)/2;//RPi.png

module case_bottom() {
    color("olive")
    difference () {
        union() {
            difference() {
                translate([-1,-1,0]) rounded_rect(bottomX, bottomY, bottomHeight, bottomThick);
                translate([-1,-1, bottomThick]) cube([bottomX, bottomY, bottomHeight]); // FILLER
                translate([piHoleOffset, piHoleOffset, -1]) bottom_hole();// MOUNT HOLE
                translate([piX-piHoleOffset, piHoleOffset, -1]) bottom_hole();
                translate([piHoleOffset, shieldY-piHoleOffset, -1]) bottom_hole();
                translate([piX-piHoleOffset, shieldY-piHoleOffset, -1]) bottom_hole();
                translate([0,0,bottomThick+bottomMountHight]) rpi(edgeCut=4); // RPI
//                translate([-1,-1,bottomHeight-bottomThick/2])
//                    rounded_rect(bottomX,bottomY,bottomThick,bottomThick/2);//LIPLOCK
                translate([-bottomThick/2-1, idcY, bottomThick+bottomMountHight+piThick])
                    cube([bottomThick/2+1, idcLength, bottomHeight-bottomThick]);// IDC
                //VENT
                for (vspace=[1:7])
                translate([piX/4, 10*vspace+2.5, -1])
                    rounded_rect(bottomX/2, 1, bottomThick+2, 1);
            }
        translate([-1.5, -1.5, 0]) cylinder(h=bottomHeight, d=4);// CASE MOUNT
        translate([piX+1.5, -1.5, 0]) cylinder(h=bottomHeight, d=4);
        translate([-1.5, piY+1.5, 0]) cylinder(h=bottomHeight, d=4);
        translate([piX+1.5, piY+1.5, 0]) cylinder(h=bottomHeight, d=4);
        }
    translate([-1.5, -1.5, -1]) cylinder(h=bottomHeight+2, d=2);// CASE MOUNT
    translate([piX+1.5, -1.5, -1]) cylinder(h=bottomHeight+2, d=2);
    translate([-1.5, piY+1.5, -1]) cylinder(h=bottomHeight+2, d=2);
    translate([piX+1.5, piY+1.5, -1]) cylinder(h=bottomHeight+2, d=2);    
    }
	//BUFFER RING
    color("olive") {
	bottom_mount(piHoleOffset, piHoleOffset, bottomThick);
	bottom_mount(piX-piHoleOffset,piHoleOffset, bottomThick);
	bottom_mount(piHoleOffset, shieldY-piHoleOffset, bottomThick);
	bottom_mount(piX-piHoleOffset, shieldY-piHoleOffset, bottomThick);
    }
}

//CASE TOP

topThick=3;
topX=56+2;// RPi.png
topY=85+2;// RPi.png
topMountHight=3;
topHeight=spacerHeight-microHeight+0.1+shieldThick+2*spacerHeight/3+displayThick+topMountHight+topThick;
topMountHoleDia=2;
topMountDia=5;// ?

module case_top() {
//    color("olive")
    difference() {
        union() {
            difference() {
                union(){
                    translate([-1,-1,0]) rounded_rect(topX, topY, topHeight, topThick);
//                    translate([-1,-1,-topThick/2])
//                        rounded_rect(topX,topY,bottomThick,bottomThick/2);//LIPLOCK
                    }
            translate([-1, -1, -topThick]) cube([topX, topY, topHeight]);// FILLER
            translate([(piX-displayX)/2, (piY-displayY+2*screenOffset)/2, 0])// SCREEN
                cube([displayX,displayY-2*screenOffset,topHeight+1]);
            translate([(piX-displayX)/2+displayHoleX,(piY-displayY)/2+displayHoleY,topHeight-topThick-0.5])// SCREEN HOLE
                cylinder(h=2, d=topMountHoleDia);
            translate([(piX-displayX)/2+displayHoleX,(piY-displayY)/2+displayY-displayHoleY,topHeight-topThick-0.5])
                cylinder(h=2, d=topMountHoleDia);
            translate([(piX-displayX)/2+displayX-displayHoleX,(piY-displayY)/2+displayHoleY,topHeight-topThick-0.5])
                cylinder(h=2, d=topMountHoleDia);
            translate([(piX-displayX)/2+displayX-displayHoleX,(piY-displayY)/2+displayY-displayHoleY,topHeight-topThick-0.5])
                cylinder(h=2, d=topMountHoleDia);
            translate([0,0,spacerHeight-microHeight+0.1]) shield(shieldEdgeCut=5);// SHILED
            translate([-topThick/2-1,idcY,-topThick-1])
                cube([bottomThick/2,idcLength,spacerHeight/3+shieldThick+shieldSPIHeight]);// IDC
            translate([0,0,-0.1-microHeight-piThick]) rpi(edgeCut=5);// PI
            }
        translate([-1.5,-1.5,0]) cylinder(h=topHeight, d=4);// CASE MOUNT
        translate([piX+1.5,-1.5,0]) cylinder(h=topHeight, d=4);
        translate([-1.5,piY+1.5,0]) cylinder(h=topHeight, d=4);
        translate([piX+1.5,piY+1.5,0]) cylinder(h=topHeight, d=4);
        }
    translate([-1.5, -1.5, -1]) cylinder(h=topHeight/4+1, d=1);// CASE MOUNT
    translate([piX+1.5, -1.5, -1]) cylinder(h=topHeight/4+1, d=1);
    translate([-1.5, piY+1.5, -1]) cylinder(h=topHeight/4+1, d=1);
    translate([piX+1.5, piY+1.5, -1]) cylinder(h=topHeight/4+1, d=1);
    }
	//BUFFER RING
    top_mount((piX-displayX)/2+displayHoleX,(piY-displayY)/2+displayHoleY,topHeight-topThick-topMountHight);
    top_mount((piX-displayX)/2+displayHoleX,(piY-displayY)/2+displayY-displayHoleY,topHeight-topThick-topMountHight);
    top_mount((piX-displayX)/2+displayX-displayHoleX,(piY-displayY)/2+displayHoleY,topHeight-topThick-topMountHight);
    top_mount((piX-displayX)/2+displayX-displayHoleX,(piY-displayY)/2+displayY-displayHoleY,topHeight-topThick-topMountHight);
}

//------------------------------------------

if (drawPi) { rpi(); }
if (drawShiled) { shield(); }
if (drawDisplay) { display(); }
if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

if (drawAll) {
    translate([-bottomX/2,-bottomY/2,0]) {// CENTER
//        translate([0,0,0]) case_bottom();
//        translate([0,0,bottomThick+bottomMountHight])
//            rpi();
//        translate([0,0,bottomThick+bottomMountHight+piThick])
//            spacer_mount();
//        translate([0,0,bottomThick+bottomMountHight+piThick+spacerHeight])
//            shield();
//        translate([(piX-displayX)/2, (piY-displayY)/2,
//            bottomThick+bottomMountHight+piThick+spacerHeight+shieldThick+2*spacerHeight/3
//        ]) display();
        translate([0,0,bottomHeight]) case_top();
    }
}
