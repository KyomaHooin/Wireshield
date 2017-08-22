//
// RPi Shiled case
//

drawPi=0;
drawShiled=0;
drawDisplay=0;
drawCaseTop=0;
drawCaseBottom=0;
drawAll=1;

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

bottomX=56;// RPi.png
bottomY=85;// RPi.png
bottomThick=3;
bottomMountHight=2;
bottomHeight=bottomThick+bottomMountHight+piThick+2*spacerHeight/3;
bottomMountDia=6.2;// RPi.png

idcLength=20*2.54;//+4.57 idc.jpg
idcY=piHoleOffset+(58-idcLength)/2;//RPi.png

module case_bottom() {
    color("olive")
	difference() {
		rounded_rect(bottomX, bottomY, bottomHeight, bottomThick);
		translate([0,0,bottomThick]) cube([bottomX, bottomY, bottomHeight]); // FILLER
		translate([piHoleOffset, piHoleOffset,-1]) bottom_hole();// MOUNT HOLE
		translate([bottomX-piHoleOffset, piHoleOffset,-1]) bottom_hole();
		translate([piHoleOffset,shieldY-piHoleOffset,-1]) bottom_hole();
        translate([bottomX-piHoleOffset,shieldY-piHoleOffset,-1]) bottom_hole();
		translate([0,0,bottomThick+bottomMountHight]) rpi(edgeCut=5); // RPI
        translate([0,0,bottomHeight-bottomThick/2])
            rounded_rect(piX,piY,bottomThick,bottomThick/2);//LIPLOCK
        translate([-bottomThick/2,idcY,bottomThick+bottomMountHight+piThick])
            cube([bottomThick/2+1,idcLength,bottomHeight-bottomThick]);// IDC
        //VENT
        for (vspace=[1:7])
        translate([bottomX/4, 10*vspace+2.5, -1])
            rounded_rect(bottomX/2, 1, bottomThick+2, 1);
	}
	//BUFFER RING
    color("olive") {
	bottom_mount(piHoleOffset, piHoleOffset, bottomThick);
	bottom_mount(bottomX-piHoleOffset,piHoleOffset, bottomThick);
	bottom_mount(piHoleOffset, shieldY-piHoleOffset, bottomThick);
	bottom_mount(bottomX-piHoleOffset, shieldY-piHoleOffset, bottomThick);    
    }
}

//CASE TOP
//
// display spacer

topX=56;// RPi.png
topY=85;// RPi.png
topThick=3;
topHeight=spacerHeight/3+shieldThick+spacerHeight+displayThick+topThick;
topMountHight=2;
topMountHoleDia=2;
topMountDia=6.2;

module case_top() {
	difference() {
        union(){
            rounded_rect(topX, topY, topHeight, topThick);
            translate([0,0,-topThick/2])
                rounded_rect(piX,piY,bottomThick,bottomThick/2);//LIPLOCK
        }
		translate([0,0,-topThick]) cube([piX, piY, topHeight]);// FILLER
		translate([(piX-displayX)/2, (piY-displayY+2*screenY)/2, 0])// SCREEN
			cube([displayX,displayY-2*screenY,topHeight+1]);
		translate([0,0,spacerHeight/3]) shield(shieldEdgeCut=3);// SHILED
        translate([-topThick/2,idcY,-topThick-1])
            cube([bottomThick/2+1,idcLength,spacerHeight/3+shieldThick+shieldSPIHeight]);// IDC
		translate([0,0,-(2*spacerHeight/3+piThick)]) rpi(edgeCut=3);// PI
	}
}

//------------------------------------------

if (drawPi) { rpi(); }
if (drawShiled) { shield(); }
if (drawDisplay) { display(); }
if (drawCaseTop) { case_top(); }
if (drawCaseBottom) { case_bottom(); }

if (drawAll) {
    translate([-bottomX/2,-bottomY/2,0]) {// CENTER
        translate([0,0,0]) case_bottom();
        translate([0,0,bottomThick+bottomMountHight])
            rpi();
        translate([0,0,bottomThick+bottomMountHight+piThick])
            spacer_mount();
        translate([0,0,bottomThick+bottomMountHight+piThick+spacerHeight])
            shield();
        translate([(piX-displayX)/2, (piY-displayY)/2,
            bottomThick+bottomMountHight+piThick+spacerHeight+shieldThick+spacerHeight
        ]) display();
        translate([0,0,bottomHeight]) case_top();
    }
}